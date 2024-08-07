import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';

abstract class UseCaseWithOneParam<Type, Param> {
  Future<Either<Failure, Type>> call(Param parameter);
}

abstract class UseCaseWithTwoParams<Type, Param1, Param2> {
  Future<Either<Failure, Type>> call(
    Param1 parameter1,
    Param2 parameter2,
  );
}

abstract class UseCaseWithThreeParams<Type, Param1, Param2, Param3> {
  Future<Either<Failure, Type>> call(
    Param1 parameter1,
    Param2 parameter2,
    Param3 parameter3,
  );
}

abstract class UseCaseWithFourParams<Type, Param1, Param2, Param3, Param4> {
  Future<Either<Failure, Type>> call(
    Param1 parameter1,
    Param2 parameter2,
    Param3 parameter3,
    Param4 parameter4,
  );
}

abstract class UseCaseWithFiveParams<Type, Param1, Param2, Param3, Param4,
    Param5> {
  Future<Either<Failure, Type>> call(
    Param1 parameter1,
    Param2 parameter2,
    Param3 parameter3,
    Param4 parameter4,
    Param5 parameter5,
  );
}
