import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_progress_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/horizontal_book_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RelatedBookList extends StatelessWidget {
  const RelatedBookList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.17,
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SimilarBooksFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else if (state is SimilarBooksSuccess) {
            return ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () => context.push(
                      AppRouter.kBookDetailsView,
                      extra: state.books[index],
                    ),
                    child: HorizontalBookListItem(
                      imgUrll: state
                              .books[index].volumeInfo?.imageLinks?.thumbnail ??
                          "",
                    ),
                  ),
                );
              },
            );
          } else {
            return const CustomProgressIndicator();
          }
        },
      ),
    );
  }
}
