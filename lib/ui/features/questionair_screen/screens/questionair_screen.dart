import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lexi_learn/config/colors/app_colors.dart';
import 'package:lexi_learn/config/routes/routes_path.dart';
import 'package:lexi_learn/core/components/custom_button.dart';
import 'package:lexi_learn/core/components/custom_navigatation.dart';
import 'package:lexi_learn/core/constant/app_constant.dart';

import '../../../../generated/l10n.dart';

class Questionnaire extends StatefulWidget {
  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  Map<String, bool?> answers = {
    "هل طفلك ممدد بالكتب الذي يحتاجها؟": null,
    "هل طفلك حاليا يدرس فى المدرسة و يحضر بانتظام؟": null,
    "هل طاقم المعلمين فى المدرسة كفء و يجيدون شرح المنهج؟": null,
    "هل تخلو البيئة المحيطة من المشاكل أسرية بين الوالدين؟": null,
    "هل تخلو حياة طفلك من اى صورة من صور التنمر؟": null,
    "هل البيئة الأسرية المحيطة توفر الدعم النفسي للطفل؟": null,
    "هل البيئة المحيطة بالطفل بها متعلمين (ليسوا أميون) بنسبة تزيد عن ٦٠%؟":
        null,
  };

  int yesCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).qAppBar,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(S.of(context).n),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(answers.length, (index) {
                  String question = answers.keys.toList()[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${index + 1}. $question',
                        style: const TextStyle(fontSize: 17.0),
                      ),
                      Row(
                        children: [
                          Radio(
                            value: true,
                            groupValue: answers[question],
                            onChanged: (value) {
                              setState(() {
                                answers[question] = value;
                                if (value == true) {
                                  yesCounter++;
                                }
                              });
                            },
                          ),
                          Text(S.of(context).yes,
                              style: const TextStyle(fontSize: 17.0)),
                          Radio(
                            value: false,
                            groupValue: answers[question],
                            onChanged: (value) {
                              setState(() {
                                answers[question] = value!;
                              });
                            },
                          ),
                          Text(
                            S.of(context).no,
                            style: const TextStyle(fontSize: 17.0),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
              Text('$yesCounter/7', style: const TextStyle(fontSize: 17.0)),
              CustomButton(
                onPressed: () {
                  CustomNavigation.navigateByNamedTo(context, RoutePath.let);
                },
                text: S.of(context).start,
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
      ),
    );
  }
}
