import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(HomeRepo homeRepo)
      : _homeRepo = homeRepo,
        super(SimilarBooksInitial());

  final HomeRepo _homeRepo;
  void fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var data = await _homeRepo.fetchSimilarBooks(category: category);
    data.fold((failure) {
      emit(
        SimilarBooksFailure(errMessage: failure.errMessage),
      );
    }, (books) {
      emit(
        SimilarBooksSuccess(books: books),
      );
    });
  }
}
