import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/colors/app_colors.dart';
import '../../../core/components/custom_button.dart';
import '../../../core/constant/app_constant.dart';
import '../../../generated/l10n.dart';

class LetStartScreen extends StatelessWidget {
  const LetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Text(
            S.of(context).let,
            style: TextStyle(fontSize: 27.sp),
          ),
          const Spacer(
            flex: 2,
          ),
          CustomButton(
            onPressed: () {},
            text: S.of(context).let,
            textColor: AppColors.kWhiteColor,
            radius: 10,
            height: 37.h,
            width: AppConstant.deviceWidth(context),
            horizontal: 20,
            vertical: 25,
            fontSize: 20,
            color: AppColors.kPrimaryColor,
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
