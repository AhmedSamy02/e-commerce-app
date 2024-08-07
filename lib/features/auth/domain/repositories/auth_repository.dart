import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';

abstract class AuthRepository {
  Future< Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> register(
      String username, String email, String password);
}
