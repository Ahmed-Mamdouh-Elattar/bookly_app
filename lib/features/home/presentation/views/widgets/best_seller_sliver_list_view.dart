import 'package:bookly_app/core/widgets/book_list_view_item.dart';
import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:bookly_app/core/widgets/custom_progress_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerSliverListView extends StatelessWidget {
  const BestSellerSliverListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomError(errMessage: state.errMessage),
          );
        } else if (state is NewestBooksSuccess) {
          return SliverList.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: BookListViewItem(
                  book: state.books[index],
                ),
              );
            },
          );
        } else {
          return const SliverToBoxAdapter(
            child: CustomProgressIndicator(),
          );
        }
      },
    );
  }
}
