import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {

 Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber = 0});

 Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0});

 Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({required String category});
}