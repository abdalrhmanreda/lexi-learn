import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lexi_learn/core/components/custom_divider.dart';
import 'package:lexi_learn/core/constant/app_constant.dart';
import 'package:lexi_learn/ui/cubit/app_cubit.dart';
import 'package:lexi_learn/ui/features/questions_screen/components/gridview_screen.dart';
import 'package:lexi_learn/ui/features/questions_screen/components/questions.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../generated/l10n.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اختار الشكل المناسب',
          style: Theme.of(context)
              .appBarTheme
              .titleTextStyle!
              .copyWith(fontSize: 17.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('السوال ${arabicNumbers[index]}'),
                  MyGridView(question: questions, qIndex: index + 1),
                ],
              ),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 5,
                  right: 5,
                ),
                child: myDivider(AppConstant.deviceWidth(context), 1),
              ),
              itemCount: questions["data"].length,
            ),
            CustomButton(
              onPressed: () {
                if (AppCubit.get(context).correctAnswer < 5) {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Oops...',
                    text:
                        'نعتذر و لكن لا يمكنك الاستكمال و ذلك لأنك لا تمتلك أعراض عسر القراءة والكتابة!',
                  );
                }
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
