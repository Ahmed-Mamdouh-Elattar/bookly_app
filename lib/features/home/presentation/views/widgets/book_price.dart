import 'package:bookly_app/core/utils/font_style.dart';
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
          style: FontStyle.textStyle15,
        ),
        Icon(
          Icons.euro,
          size: 18,
        ),
      ],
    );
  }
}
