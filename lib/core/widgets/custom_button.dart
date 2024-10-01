import 'package:bookly_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.borderRadius,
    this.onPressed,
    required this.text,
  });
  final Color backgroundColor, textColor;
  final BorderRadiusGeometry borderRadius;
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          child: Text(
            text,
            style: AppStyle.textStyle15.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
