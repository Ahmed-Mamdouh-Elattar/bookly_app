import 'package:bookly_app/core/utils/app_style.dart';

import 'package:bookly_app/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_results_list.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Results",
            style: AppStyle.textStyle18,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SearchResultsList(),
          ),
        ],
      ),
    );
  }
}
