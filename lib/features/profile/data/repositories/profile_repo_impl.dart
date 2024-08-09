import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/core/errors/server_failure.dart';
import 'package:simple_ecommerce/core/errors/unexpected_failure.dart';
import 'package:simple_ecommerce/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:simple_ecommerce/features/profile/domain/repositories/profile_repo.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl({required this.profileRemoteDataSource});
  @override
  Future<Either<Failure, void>> changePassword(
      String oldPassword, String newPassword) async {
    try {
      await profileRemoteDataSource.changePassword(oldPassword, newPassword);
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDio(e));
    } catch (e) {
      return left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(
      String firstName, String lastName)async {
        try {
      await profileRemoteDataSource.updateProfile(firstName, lastName);
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDio(e));
    } catch (e) {
      return left(UnexpectedFailure(message: e.toString()));
    }
  }
}
