import 'package:flutter/material.dart';

class CustomTextAnimation extends StatelessWidget {
  const CustomTextAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.bounceInOut,
      duration: const Duration(seconds: 4),
      tween: ColorTween(
        begin: Colors.transparent,
        end: Colors.white70,
      ),
      builder: (context, value, child) {
        return Text(
          "Read Free Books",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: value,
          ),
        );
      },
    );
  }
}
