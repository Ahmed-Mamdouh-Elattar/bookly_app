import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/core/widgets/book_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          if (state.books.isEmpty) {
            return const Center(
              child: Text(
                'No results found',
                style: AppStyle.textStyle18,
              ),
            );
          }
          return ListView.builder(
            itemCount: state.books.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: BookListViewItem(
                  book: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: AppStyle.textStyle18,
            ),
          );
        } else if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text(
              "Search for books",
              style: AppStyle.textStyle18,
            ),
          );
        }
      },
    );
  }
}
