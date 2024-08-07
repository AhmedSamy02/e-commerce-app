import 'package:dio/dio.dart';
import 'package:simple_ecommerce/core/constants/models/user.dart';
import 'package:simple_ecommerce/core/constants/values.dart';

abstract class AuthRemoteDataSource {
  Future<User> login(String email, String password);
  Future<void> register(
      String firstName, String lastName, String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});
  final loginEndpoint = '/login';
  final registerEndpoint = '/register';
  @override
  Future<User> login(String email, String password) async {
    final response = await dio.post('$kAuthMainLink$loginEndpoint', data: {
      'email': email,
      'password': password,
    });
    return User.fromJson(response.data['data']);
  }

  @override
  Future<void> register(
      String firstName, String lastName, String email, String password) async {
    await dio.post('$kAuthMainLink$registerEndpoint', data: {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    });
  }
}
