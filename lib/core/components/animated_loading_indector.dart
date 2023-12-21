import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../config/colors/app_colors.dart';

class AnimatedLoadingIndector extends StatelessWidget {
  const AnimatedLoadingIndector({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: const Color(AppColors.kPrimaryColor),
        size: 55,
      ),
    );
  }
}
