import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/components/custom_text_form_feild.dart';
import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/constant/app_constant.dart';

class CustomTwoTextFromField extends StatelessWidget {
  CustomTwoTextFromField({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.label1,
    required this.label2,
    required this.isPass,
    required this.isPass2,
    this.prefixIcon1,
    this.prefixIcon2,
    required this.textInputType,
    required this.textInputType2,
  });
  final TextEditingController controller1;
  final TextEditingController controller2;
  final String label1;
  final String label2;
  final bool isPass;
  final bool isPass2;
  IconData? prefixIcon1;
  IconData? prefixIcon2;
  final TextInputType textInputType;
  final TextInputType textInputType2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: AppConstant.deviceWidth(context),
          height: 47.h,
          decoration: BoxDecoration(
            color: const Color(AppColors.kLightGaryColor),
            borderRadius: BorderRadius.circular(15),
          ),
          child: CustomTextFormField(
            isPassword: isPass,
            maxLine: 1,
            controller: controller1,
            border: InputBorder.none,
            label: label1,
            type: textInputType,
            validate: (value) {
              if (value!.isEmpty) {
                return "should enter $label2";
              } else {
                return null;
              }
            },
            prefixIcon: prefixIcon1,
            edgeInsetsGeometry: const EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
        ),
        const Gap(20),
        Container(
          width: AppConstant.deviceWidth(context),
          height: 50.h,
          decoration: BoxDecoration(
            color: const Color(AppColors.kLightGaryColor),
            borderRadius: BorderRadius.circular(15),
          ),
          child: CustomTextFormField(
            isPassword: isPass2,
            maxLine: 1,
            type: textInputType2,
            controller: controller2,
            validate: (value) {
              if (value!.isEmpty) {
                return "should enter $label2";
              } else {
                return null;
              }
            },
            border: InputBorder.none,
            label: label2,
            prefixIcon: prefixIcon2,
            edgeInsetsGeometry: const EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
        ),
      ],
    );
  }
}
