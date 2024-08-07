import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/font_style.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_price.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Row(
        children: [
          SizedBox(
            height: 114,
            child: AspectRatio(
              aspectRatio: 0.64,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeI00967LtKfjFtI4oyGwdu3Alh_KQQUzv8g&s'),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'The Jungle Book',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FontStyle.textStyle20,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Rudyard Kipling',
                  style: FontStyle.textStyle14.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  children: [
                    BookPrice(),
                    Spacer(
                      flex: 1,
                    ),
                    BookRating(),
                    Spacer(
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
