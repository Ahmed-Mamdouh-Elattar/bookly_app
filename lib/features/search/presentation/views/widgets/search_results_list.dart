import 'package:flutter/material.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 20),
          // child: BestSellerListViewItem(),
          child: Center(child: Text("Data")),
        );
      },
    );
  }
}
