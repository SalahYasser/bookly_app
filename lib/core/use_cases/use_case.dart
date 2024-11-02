import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, param> {
  Future<Either<Failure, Type>> call([param param]);
}

class NoParam {}
