import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget richText(
        {required String word,
        required List<int> colors,
        required BuildContext context}) =>
    RichText(
      text: TextSpan(
        text: word[0],
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Color(colors[0]),
              fontSize: 20.sp,
            ),
        children: List.generate(
          word.length - 1,
          (index) => TextSpan(
            text: word[index + 1],
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Color(colors[index]),
                  fontSize: 20.sp,
                ),
          ),
        ),
      ),
    );
