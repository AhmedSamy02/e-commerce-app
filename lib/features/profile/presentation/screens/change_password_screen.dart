import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';
import 'package:simple_ecommerce/core/constants/widgets/auth_normal_button.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/password_text_form_field.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/password_with_checker.dart';
import 'package:simple_ecommerce/features/profile/presentation/controllers/profile_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ProfileCubit>(context);
    final oldPasswordController = controller.oldPasswordController;
    final newPasswordController = controller.newPasswordController;
    final confirmNewPasswordController = controller.confirmNewPasswordController;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        toolbarHeight: 0.04.sh,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                kChangePasswordAsset,
                height: 0.4.sh,
              ),
              Padding(
                padding: EdgeInsets.all(18.sp),
                child: Column(
                  children: [
                    PasswordTextFormField(
                      textInputAction: TextInputAction.done,
                      controller: oldPasswordController,
                      labelText: 'Old Password',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PasswordWithChecker(
                      controller: newPasswordController,
                      labelText: 'New Password',
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PasswordTextFormField(
                      textInputAction: TextInputAction.done,
                      controller: confirmNewPasswordController,
                      labelText: 'Confirm Password',
                    ),SizedBox(
                      height: 20.h,
                    ),
                    MainNormalButton(text: 'Apply', onPressed: () {
                      BlocProvider.of<ProfileCubit>(context).changePassword(context);
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
