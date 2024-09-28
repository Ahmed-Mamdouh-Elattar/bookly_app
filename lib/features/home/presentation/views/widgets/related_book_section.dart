import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/horizontal_book_list_item.dart';
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

class RelatedBookList extends StatelessWidget {
  const RelatedBookList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.17,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 10),
            child: HorizontalBookListItem(
              imgUrll:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeI00967LtKfjFtI4oyGwdu3Alh_KQQUzv8g&s',
            ),
          );
        },
      ),
    );
  }
}
