import 'package:bookly_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class BookPrice extends StatelessWidget {
  const BookPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Free',
          style: AppStyle.textStyle15,
        ),
      ],
    );
  }
}
