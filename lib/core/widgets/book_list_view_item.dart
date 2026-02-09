import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/core/widgets/book_price.dart';
import 'package:bookly_app/core/widgets/book_rating.dart';
import 'package:bookly_app/core/widgets/custom_book_image.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: Row(
        children: [
          SizedBox(
            height: 114,
            child: CustomBookImage(
              imgUrll: book.volumeInfo!.imageLinks!.smallThumbnail!,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.volumeInfo!.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.textStyle20,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  book.volumeInfo?.authors?[0] ?? "Not mentioned",
                  style: AppStyle.textStyle14.copyWith(
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const BookPrice(),
                    const Spacer(
                      flex: 1,
                    ),
                    BookRating(
                      rating: book.volumeInfo?.averageRating ?? 0,
                      count: book.volumeInfo?.ratingsCount ?? 0,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
