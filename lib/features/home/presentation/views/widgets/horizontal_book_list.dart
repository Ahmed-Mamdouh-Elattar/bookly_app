import 'package:bookly_app/features/home/presentation/views/widgets/horizontal_book_list_item.dart';
import 'package:flutter/material.dart';

class HorizontalBookList extends StatelessWidget {
  const HorizontalBookList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.27,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 10),
            child: HorizontalBookListItem(),
          );
        },
      ),
    );
  }
}
