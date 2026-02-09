import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_results_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                BlocProvider.of<SearchCubit>(context)
                    .fetchSearchedBooks(searchedText: value);
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Results",
            style: AppStyle.textStyle18,
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: SearchResultsList(),
          ),
        ],
      ),
    );
  }
}
