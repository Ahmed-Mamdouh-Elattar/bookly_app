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
          '19.99',
          style: AppStyle.textStyle15,
        ),
        Icon(
          Icons.euro,
          size: 18,
        ),
      ],
    );
  }
}
