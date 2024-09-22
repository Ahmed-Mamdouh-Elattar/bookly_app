import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section_with_body.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/related_book_section.dart';

import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomBookDetailsAppBar(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 36,
            ),
          ),
          SliverToBoxAdapter(
            child: BookDetailsWithButtonSection(),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 59,
                  ),
                ),
                RelatedBookSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
