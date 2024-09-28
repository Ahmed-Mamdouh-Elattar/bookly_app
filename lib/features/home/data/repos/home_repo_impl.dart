import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices _apiServices;

  HomeRepoImpl({required ApiServices apiServices}) : _apiServices = apiServices;

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await _apiServices.get(
          endpoint:
              "volumes?q=subject: programming&orderBy=newest&filter=free-ebooks");
      List<BookModel> bookModel = [];
      for (var item in data["items"]) {
        bookModel.add(BookModel.fromJson(item));
      }
      return right(bookModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await _apiServices.get(
          endpoint: "volumes?q=subject: programming &filter=free-ebooks");
      List<BookModel> bookModel = [];
      for (var item in data["items"]) {
        bookModel.add(BookModel.fromJson(item));
      }
      return right(bookModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
