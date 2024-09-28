import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(HomeRepo homeRepo)
      : _homeRepo = homeRepo,
        super(NewestBooksInitial());
  final HomeRepo _homeRepo;
  void fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var data = await _homeRepo.fetchNewestBooks();
    data.fold((failure) {
      emit(
        NewestBooksFailure(errMessage: failure.errMessage),
      );
    }, (books) {
      emit(
        NewestBooksSuccess(books: books),
      );
    });
  }
}
