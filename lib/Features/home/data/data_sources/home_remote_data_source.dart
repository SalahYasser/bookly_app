import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/helper_functions/build_get_books_list.dart';
import 'package:bookly/core/utils/helper_functions/save_books_data.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();

  Future<List<BookEntity>> fetchSimilarBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {

  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming');

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, kFeaturedBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {

    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, kNewestBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks() async {
    var data = await apiService.get(
        endPoint:
        'volumes?Filtering=free-ebooks&q=programming');

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, kSimilarBox);

    return books;
  }
}
