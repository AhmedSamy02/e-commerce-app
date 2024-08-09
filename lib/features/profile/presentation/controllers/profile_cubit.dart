import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:quickalert/quickalert.dart';
import 'package:simple_ecommerce/core/constants/methods.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/core/errors/server_failure.dart';
import 'package:simple_ecommerce/features/profile/domain/repositories/profile_repo.dart';
import 'package:simple_ecommerce/features/profile/presentation/controllers/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepository) : super(ProfileInitial());
  final ProfileRepository profileRepository;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  String oldFirstName = '';
  String oldLastName = '';
  void initializeControllers() async {
    final secure = getit.get<FlutterSecureStorage>();
    firstNameController.text = (await secure.read(key: kFirstNamePref))!;
    oldFirstName = firstNameController.text;
    lastNameController.text = (await secure.read(key: kLastNamePref))!;
    oldLastName = lastNameController.text;
    emailController.text = (await secure.read(key: kEmailPref))!;
    emit(ProfileInitial());
  }

  Future<void> updateProfile(BuildContext context) async {
    if (firstNameController.text.isEmpty || lastNameController.text.isEmpty) {
      showErrorQuickAlert(context, 'Form Error', 'Please fill all fields');
      return;
    }
    if (firstNameController.text == oldFirstName &&
        lastNameController.text == oldLastName) {
      showErrorQuickAlert(context, 'Form Error', 'No changes made');
      return;
    }
    showLoadingQuickAlert(context, 'Loading', 'Updating profile');
    final response = await profileRepository.updateProfile(
      firstNameController.text,
      lastNameController.text,
    );
    Navigator.pop(context);
    response.fold((failure) {
      if (failure is ServerFailure) {
        showErrorQuickAlert(context, 'Server Error', failure.message);
        return;
      }
      showErrorQuickAlert(context, 'Unexpected Error', failure.message);
    }, (data) async {
      final secure = getit.get<FlutterSecureStorage>();
      secure.write(key: kFirstNamePref, value: firstNameController.text);
      secure.write(key: kLastNamePref, value: lastNameController.text);
      oldFirstName = firstNameController.text;
      oldLastName = lastNameController.text;
      emit(ProfileLoaded());
      await QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Success',
        text: 'Password changed successfully',
        autoCloseDuration: 4.seconds,
        showConfirmBtn: false,
      );
      Navigator.pop(context);
    });
  }

  Future<void> changePassword(BuildContext context) async {
    if (oldPasswordController.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        confirmNewPasswordController.text.isEmpty) {
      showErrorQuickAlert(context, 'Form Error', 'Please fill all fields');
      return;
    }
    if (PasswordStrength.calculate(text: newPasswordController.text) !=
            PasswordStrength.strong &&
        PasswordStrength.calculate(text: newPasswordController.text) !=
            PasswordStrength.secure) {
      showErrorQuickAlert(
          context, 'Form Error', 'Password is not strong enough');
      return;
    }
    if (newPasswordController.text != confirmNewPasswordController.text) {
      showErrorQuickAlert(context, 'Form Error', 'Password does not match');
      return;
    }
    showLoadingQuickAlert(context, 'Loading', 'Changing password');

    final response = await profileRepository.changePassword(
      oldPasswordController.text,
      newPasswordController.text,
    );
    Navigator.pop(context);
    response.fold((failure) {
      if (failure is ServerFailure) {
        showErrorQuickAlert(context, 'Server Error', failure.message);
        return;
      }
      showErrorQuickAlert(context, 'Unexpected Error', failure.message);
    }, (data) async {
      await QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Success',
        text: 'Password changed successfully',
        autoCloseDuration: 4.seconds,
        showConfirmBtn: false,
      );
      oldPasswordController.clear();
      newPasswordController.clear();
      confirmNewPasswordController.clear();
      Navigator.pop(context);
    });
  }
}
