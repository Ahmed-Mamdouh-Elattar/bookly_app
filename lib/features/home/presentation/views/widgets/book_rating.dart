import 'package:bookly_app/core/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 15,
        ),
        const Text(
          ' 4.8 ',
          style: FontStyle.textStyle16,
        ),
        Text(
          '(2390)',
          style: FontStyle.textStyle14.copyWith(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
