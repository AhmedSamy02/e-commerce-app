import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}
