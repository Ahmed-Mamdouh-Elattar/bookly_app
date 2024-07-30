import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/custom_text_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBodey extends StatefulWidget {
  const SplashViewBodey({super.key});

  @override
  State<SplashViewBodey> createState() => _SplashViewBodeyState();
}

class _SplashViewBodeyState extends State<SplashViewBodey> {
  @override
  void initState() {
    super.initState();
    navigateToHomeView();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(Assets.logo),
          const CustomTextAnimation(),
        ]);
  }

  Future<Null> navigateToHomeView() {
    return Future.delayed(const Duration(seconds: 3), () {
      Get.to(
        const HomeView(),
        transition: Transition.fadeIn,
        duration: kTransitionDuration,
      );
    });
  }
}
