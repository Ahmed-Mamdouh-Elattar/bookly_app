import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(HomeRepo homeRepo)
      : _homeRepo = homeRepo,
        super(FeaturedBooksInitial());
  final HomeRepo _homeRepo;
  fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var data = await _homeRepo.fetchFeaturedBooks();
    data.fold((failure) {
      emit(
        FeaturedBooksFailure(errMessage: failure.errMessage),
      );
    }, (books) {
      emit(
        FeaturedBooksSuccess(books: books),
      );
    });
  }
}
