import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lexi_learn/core/constant/app_constant.dart';
import 'package:lexi_learn/ui/features/determine_reading_difficulties/components/rish_text.dart';
import 'package:lexi_learn/ui/features/determine_reading_difficulties/components/test_and_color.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../generated/l10n.dart';

class DetermineReadingDifficultiesScreen extends StatefulWidget {
  const DetermineReadingDifficultiesScreen({super.key});

  @override
  State<DetermineReadingDifficultiesScreen> createState() =>
      _DetermineReadingDifficultiesScreenState();
}

class _DetermineReadingDifficultiesScreenState
    extends State<DetermineReadingDifficultiesScreen> {
  int correctAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اختر اللون الذي يمثل حرف الباء'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              padding: const EdgeInsets.all(5),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => QuizQuestion(
                question: colorQuestions['data'][index]['question${index + 1}']
                    ['q'],
                data: colorQuestions['data'][index]['question${index + 1}'],
                index: index + 1,
              ),
              itemCount: colorQuestions['data'].length,
              separatorBuilder: (context, index) => const Gap(5),
            ),
            CustomButton(
              onPressed: () {
                // if (AppCubit.get(context).correctAnswer < 5) {
                //   QuickAlert.show(
                //     context: context,
                //     type: QuickAlertType.error,
                //     title: 'Oops...',
                //     text:
                //     'نعتذر و لكن لا يمكنك الاستكمال و ذلك لأنك لا تمتلك أعراض عسر القراءة والكتابة!',
                //   );
                // }
              },
              text: S.of(context).send,
              textColor: AppColors.kWhiteColor,
              radius: 10,
              height: 37.h,
              width: AppConstant.deviceWidth(context) / 2,
              horizontal: 0,
              vertical: 10,
              color: AppColors.kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class QuizQuestion extends StatefulWidget {
  final String question;
  final Map<String, dynamic> data;
  final int index;

  const QuizQuestion({
    super.key,
    required this.question,
    required this.data,
    required this.index,
  });

  @override
  _QuizQuestionState createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  int? groupValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstant.deviceHeight(context) / 4.6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('${widget.index} - '),
            Row(
              children: [
                Text('${widget.index} - '),
                richText(
                    word: widget.question,
                    colors: widget.data['choose'],
                    context: context),
              ],
            ),
            const Gap(10),
            SizedBox(
              height: 100.h,
              width: AppConstant.deviceWidth(context),
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(5),
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, innerIndex) => GestureDetector(
                  onTap: () {
                    setState(() {
                      groupValue = widget.data['choose'][innerIndex];
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(widget.data['choose'][innerIndex]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Radio<int>(
                        value: widget.data['choose'][innerIndex],
                        groupValue: groupValue,
                        onChanged: (int? value) {
                          setState(() {
                            groupValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                itemCount: widget.data['choose'].length,
                separatorBuilder: (context, innerIndex) => const Gap(25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
