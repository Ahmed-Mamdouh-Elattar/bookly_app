import 'package:bookly_app/core/utils/app_style.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/related_book_list.dart';
import 'package:flutter/material.dart';

class RelatedBookSection extends StatelessWidget {
  const RelatedBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like",
          style: AppStyle.textStyle14,
        ),
        SizedBox(
          height: 10,
        ),
        RelatedBookList(),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
