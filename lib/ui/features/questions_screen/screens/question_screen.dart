import 'package:flutter/material.dart';
import 'package:lexi_learn/core/components/custom_divider.dart';
import 'package:lexi_learn/core/constant/app_constant.dart';
import 'package:lexi_learn/ui/features/questions_screen/components/gridview_screen.dart';
import 'package:lexi_learn/ui/features/questions_screen/components/questions.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختار الشكل المناسب'),
      ),
      body: ListView.separated(
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
    );
  }
}
