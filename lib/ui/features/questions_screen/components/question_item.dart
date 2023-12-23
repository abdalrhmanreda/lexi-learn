import 'package:flutter/material.dart';

import '../../../../core/constant/app_constant.dart';

Container buildContainerQuestion(
    {required BuildContext context, required String image}) {
  return Container(
    width: AppConstant.deviceWidth(context),
    height: AppConstant.deviceHeight(context) / 3,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(
        image: AssetImage(image),
      ),
    ),
  );
}
