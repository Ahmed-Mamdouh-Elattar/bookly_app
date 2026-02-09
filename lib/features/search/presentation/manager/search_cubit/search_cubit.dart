import 'dart:async';

import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Timer? _debounce;

  void fetchSearchedBooks({required String searchedText}) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(SearchLoading());
      var result =
          await searchRepo.fetchSearchedBooks(searchedText: searchedText);
      result.fold((failure) {
        emit(
          SearchFailure(errMessage: failure.errMessage),
        );
      }, (books) {
        emit(
          SearchSuccess(books: books),
        );
      });
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
