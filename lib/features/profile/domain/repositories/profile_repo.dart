import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';

abstract class ProfileRepository {
  Future<Either<Failure,void>>updateProfile(String firstName, String lastName);
  Future<Either<Failure,void>>changePassword(String oldPassword, String newPassword);
}