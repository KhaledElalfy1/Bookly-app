import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRpoImp extends SearchRepo{
  final ApiServices apiServices;

  SearchRpoImp( this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks({required String query}) async{
   try {
  var data =await apiServices.get(endpoint: 'volumes?Filtering=free-ebooks&q=$query');
   List<BookModel> books = [];
   for (var element in data['items']) {
     books.add(BookModel.fromJson(element));
   }
    return right(books);
} on Exception catch (e) {
  if (e is DioException) {
    return left(ServerError.fromDioError(e));
  }
  return left(ServerError(e.toString()));
}
    

  }

}