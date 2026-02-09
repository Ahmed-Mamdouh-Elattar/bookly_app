import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section_with_body.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/related_book_section.dart';

import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 10, right: 16),
            child: CustomBookDetailsAppBar(),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 36,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: BookDetailsWithButtonSection(
              book: book,
            ),
          ),
        ),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: 59,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: RelatedBookSection(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
