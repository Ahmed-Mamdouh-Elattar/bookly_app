import 'dart:developer';

import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String searchedText}) async {
    try {
      var data = await apiServices.get(
        endpoint: 'volumes?q=$searchedText&filter=free-ebooks',
      );
      List<BookModel> books = [];
      log(data.toString());
      if (data['items'] != null) {
        for (var item in data['items']) {
          try {
            books.add(BookModel.fromJson(item));
          } catch (e) {
            // ignore invalid items
          }
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
