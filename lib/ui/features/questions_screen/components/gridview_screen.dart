import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lexi_learn/config/colors/app_colors.dart';
import 'package:lexi_learn/core/constant/app_constant.dart';
import 'package:lexi_learn/ui/cubit/app_cubit.dart';
import 'package:lexi_learn/ui/features/questions_screen/components/question_item.dart';
import 'package:lexi_learn/ui/features/questions_screen/components/questions.dart';

class MyGridView extends StatefulWidget {
  const MyGridView({super.key, required this.question, required this.qIndex});

  final Map<String, dynamic> question;
  final int qIndex;

  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  String? selectedImagePath;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              buildContainerQuestion(
                context: context,
                image: questions["data"][widget.qIndex - 1]
                    ["question${widget.qIndex}"]['q'],
              ),
              const Gap(25),
              SizedBox(
                height: AppConstant.deviceHeight(context) / 2.7,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: .8,
                  ),
                  itemCount: questions["data"][widget.qIndex - 1]
                          ["question${widget.qIndex}"]["choose"]
                      .length,
                  itemBuilder: (context, index) {
                    String imagePath = questions["data"][widget.qIndex - 1]
                        ["question${widget.qIndex}"]["choose"][index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImagePath = imagePath;
                          if (selectedImagePath ==
                              questions["data"][widget.qIndex - 1]
                                  ["question${widget.qIndex}"]["answer"]) {
                            AppCubit.get(context).correctAnswer++;
                          }
                          debugPrint(selectedImagePath);
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: selectedImagePath == imagePath
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 4.0,
                              ),
                            ),
                            child: Image.asset(
                              imagePath,
                              width: 90.0,
                              height: 90.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Radio(
                            value: imagePath,
                            activeColor: const Color(AppColors.kPrimaryColor),
                            groupValue: selectedImagePath,
                            onChanged: (value) {
                              setState(() {
                                selectedImagePath = value;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
