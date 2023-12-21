import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lexi_learn/config/routes/routes_path.dart';
import 'package:lexi_learn/core/components/custom_button.dart';
import 'package:lexi_learn/core/components/custom_navigatation.dart';
import 'package:lexi_learn/core/constant/app_constant.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../config/colors/app_colors.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            Text(
              S.of(context).appName,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 40,
                    fontFamily: 'Bobbers',
                    color: const Color(AppColors.textColor),
                  ),
            ),
            const Spacer(
              flex: 2,
            ),
            CustomButton(
              onPressed: () {
                CustomNavigation.navigateByNamedTo(context, RoutePath.signUp);
              },
              text: S.of(context).register,
              color: AppColors.kPrimaryColor,
              width: AppConstant.deviceWidth(context),
              height: 37.h,
              vertical: 5,
              horizontal: 15,
              fontSize: 17.sp,
              radius: 10,
              textColor: AppColors.kWhiteColor,
            ),
            CustomButton(
              onPressed: () {
                CustomNavigation.navigateByNamedTo(context, RoutePath.login);
              },
              text: S.of(context).login,
              color: AppColors.kGreyColor,
              width: AppConstant.deviceWidth(context),
              height: 37.h,
              vertical: 15,
              horizontal: 15,
              fontSize: 17.sp,
              radius: 10,
              textColor: AppColors.kWhiteColor,
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
