import 'package:flutter/material.dart';

class HorizontalBookListItem extends StatelessWidget {
  const HorizontalBookListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.66,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeI00967LtKfjFtI4oyGwdu3Alh_KQQUzv8g&s'),
          ),
        ),
      ),
    );
  }
}
