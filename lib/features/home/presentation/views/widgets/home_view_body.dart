import 'package:bookly_app/core/utils/font_style.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/horizontal_book_list.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(
            height: 40,
          ),
          HorizontalBookList(),
          SizedBox(
            height: 40,
          ),
          Text(
            "Best Seller",
            style: FontStyle.titleMedium,
          ),
        ],
      ),
    );
  }
}
