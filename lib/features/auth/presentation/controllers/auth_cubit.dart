import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce/core/constants/methods.dart';
import 'package:simple_ecommerce/core/constants/screens.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:simple_ecommerce/features/auth/domain/use_cases/login_use_case.dart';
import 'package:simple_ecommerce/features/auth/domain/use_cases/register_use_case.dart';
import 'package:simple_ecommerce/features/auth/presentation/controllers/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> login(
      String? email, String? password, BuildContext context) async {
    if (email == null ||
        password == null ||
        email.isEmpty ||
        password.isEmpty) {
      showErrorQuickAlert(
          context, 'Error', 'Email and password cannot be empty');
      emit(AuthError('Email and password cannot be empty'));
      return;
    }
    emit(AuthLoading());
    try {
      final response =
          await LoginUseCase(repository: getit.get<AuthRepository>())
              .call(email, password);
      response.fold((failure) {
        showErrorQuickAlert(context, 'Server error', failure.message);
        emit(AuthError(failure.message));
      }, (none) {
        Navigator.pushReplacementNamed(context, kHomeScreen);
      });
    } catch (e) {
      showErrorQuickAlert(context, 'Error', 'An error has occured');
      emit(AuthError('An error has occured'));
    }
  }

  Future<void> register(
    String firstName,
    String lastName,
    String email,
    String password,
    BuildContext context,
    GlobalKey<FormState> formKey,
  ) async {
    if(firstName.isEmpty){
      showErrorQuickAlert(context, 'Error', 'First name cannot be empty');
      emit(AuthError('First name cannot be empty'));
      return;
    }
    if(lastName.isEmpty){
      showErrorQuickAlert(context, 'Error', 'Last name cannot be empty');
      emit(AuthError('Last name cannot be empty'));
      return;
    }
    if(email.isEmpty){
      showErrorQuickAlert(context, 'Error', 'Email cannot be empty');
      emit(AuthError('Email cannot be empty'));
      return;
    }
    if(password.isEmpty){
      showErrorQuickAlert(context, 'Error', 'Password cannot be empty');
      emit(AuthError('Password cannot be empty'));
      return;
    }

    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(AuthLoading());
    try {
      final response =
          await RegisterUseCase(repository: getit.get<AuthRepository>())
              .call(firstName, lastName, email, password);
      response.fold((failure) {
        showErrorQuickAlert(context, 'Server error', failure.message);
        emit(AuthError(failure.message));
      }, (none) {
        Navigator.pushReplacementNamed(context, kLoginScreen);
      });
    } catch (e) {
      showErrorQuickAlert(context, 'Error', 'An error has occured');
      emit(AuthError('An error has occured'));
    }
  }
}
