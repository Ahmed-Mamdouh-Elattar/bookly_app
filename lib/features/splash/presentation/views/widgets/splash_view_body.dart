import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/custom_text_animation.dart';
import 'package:flutter/material.dart';

class SplashViewBodey extends StatelessWidget {
  const SplashViewBodey({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assets.logo),
        const CustomTextAnimation(),
      ],
    );
  }
}
