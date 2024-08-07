import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quickalert/quickalert.dart';
import 'package:simple_ecommerce/core/constants/models/user.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:simple_ecommerce/features/auth/data/repositories/auth_repositoriy.dart';
import 'package:simple_ecommerce/features/auth/domain/repositories/auth_repository.dart';

void initializeLocators() {
  final dio = Dio();
  getit.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  getit.registerSingleton<AuthRepository>(
    AuthRepositoriyImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(dio: dio),
    ),
  );
}

Future<void> showLoadingQuickAlert(
    BuildContext context, String? title, String? body) async {
  await QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: title ?? 'Loading',
      text: body ?? 'Please wait while we are processing your request');
}

Future<void> showErrorQuickAlert(
    BuildContext context, String? title, String? body) async {
  await QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: title ?? 'Error',
      text: body ?? 'An error has occured');
}

bool checkName(String text) {
  return RegExp(r"^[A-Za-z][A-Za-z'-]{0,24}$").hasMatch(text);
}

Future<void> cacheUser(User user) async {
  final secureStorage = getit.get<FlutterSecureStorage>();
  await secureStorage.write(key: 'token', value: user.token!);
  await secureStorage.write(key: 'email', value: user.email);
  await secureStorage.write(key: 'firstName', value: user.firstName);
  await secureStorage.write(key: 'lastName', value: user.lastName);
  await secureStorage.write(key: 'id', value: user.id);
}

Future<void> clearCache() async {
  await getit.get<FlutterSecureStorage>().deleteAll();
}
