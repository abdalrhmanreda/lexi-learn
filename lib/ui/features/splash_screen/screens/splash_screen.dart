import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lexi_learn/config/colors/app_colors.dart';
import 'package:lexi_learn/config/routes/routes_path.dart';
import 'package:lexi_learn/core/components/custom_navigatation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: DefaultTextStyle(
            style: const TextStyle(
                fontFamily: 'Bobbers',
                fontSize: 45,
                color: Color(AppColors.textColor)),
            child: AnimatedTextKit(
              totalRepeatCount: 3,
              pause: const Duration(milliseconds: 750),
              animatedTexts: [
                TyperAnimatedText('LexiLearn'),
              ],
              onFinished: () {
                CustomNavigation.navigateByNamedTo(context, RoutePath.choose);
              },
            ),
          ),
        ),
      ),
    );
  }
}
