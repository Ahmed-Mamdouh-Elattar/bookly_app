import 'package:bookly_app/core/utils/font_style.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_price.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

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
