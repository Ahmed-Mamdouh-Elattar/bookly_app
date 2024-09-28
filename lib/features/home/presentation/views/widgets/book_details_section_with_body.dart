import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/horizontal_book_list_item.dart';
import 'package:flutter/material.dart';

class BookDetailsWithButtonSection extends StatelessWidget {
  const BookDetailsWithButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.45,
          child: const HorizontalBookListItem(
            imgUrll:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeI00967LtKfjFtI4oyGwdu3Alh_KQQUzv8g&s',
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        Text(
          "The Jungle Book",
          style: AppStyle.textStyle20.copyWith(
            fontSize: 30,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Rudyard Kipling",
          style: AppStyle.textStyle18
              .copyWith(color: Colors.white.withOpacity(0.7)),
        ),
        const SizedBox(
          height: 17,
        ),
        const BookRating(
          rating: 4,
          count: 55,
        ),
        const SizedBox(
          height: 37,
        ),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: () {},
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
            ),
            Expanded(
              child: CustomButton(
                onPressed: () {},
                backgroundColor: const Color(0xffef8262),
                textColor: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
