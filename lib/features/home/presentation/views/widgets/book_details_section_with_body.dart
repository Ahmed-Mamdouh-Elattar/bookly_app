import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/core/widgets/book_rating.dart';
import 'package:bookly_app/core/widgets/custom_book_image.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class BookDetailsWithButtonSection extends StatelessWidget {
  const BookDetailsWithButtonSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.45,
          child: CustomBookImage(
            imgUrll: book.volumeInfo?.imageLinks?.thumbnail ?? "",
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        Text(
          book.volumeInfo!.title!,
          style: AppStyle.textStyle20.copyWith(
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          book.volumeInfo?.authors?[0] ?? "",
          style: AppStyle.textStyle18
              .copyWith(color: Colors.white.withValues(alpha: 0.7)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 17,
        ),
        BookRating(
          rating: book.volumeInfo?.averageRating ?? 0,
          count: book.volumeInfo?.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 37,
        ),
        Row(
          children: [
            const Expanded(
              child: CustomButton(
                text: "Free",
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
            ),
            Expanded(
              child: CustomButton(
                onPressed: () {
                  customlaunchUrl(url: book.accessInfo!.webReaderLink!);
                },
                text: "Preview",
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

  Future<void> customlaunchUrl({required String url}) async {
    final Uri urlLauncher = Uri.parse(url);
    if (await canLaunchUrl(urlLauncher)) {
      launchUrl(urlLauncher);
    }
  }
}
