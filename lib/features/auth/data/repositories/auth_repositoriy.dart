import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/core/errors/server_failure.dart';
import 'package:simple_ecommerce/core/errors/unexpected_failure.dart';
import 'package:simple_ecommerce/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:simple_ecommerce/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoriyImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoriyImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      final token = await remoteDataSource.login(email, password);
      await getit.get<FlutterSecureStorage>().write(key: 'token', value: token);
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDio(e));
    } catch (e) {
      return left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> register(
      String username, String email, String password) async {
    try {
      await remoteDataSource.register(username, email, password);
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDio(e));
    } catch (e) {
      return left(UnexpectedFailure(message: e.toString()));
    }
  }
}
