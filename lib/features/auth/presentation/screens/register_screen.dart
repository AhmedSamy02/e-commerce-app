import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';
import 'package:simple_ecommerce/core/constants/methods.dart';
import 'package:simple_ecommerce/core/constants/screens.dart';
import 'package:simple_ecommerce/core/constants/widgets/terms_of_conditions.dart';
import 'package:simple_ecommerce/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:simple_ecommerce/features/auth/presentation/controllers/auth_states.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/auth_loading_button.dart';
import 'package:simple_ecommerce/core/constants/widgets/auth_normal_button.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/auth_paragraph.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/auth_row.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/email_text_form_field.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/password_with_checker.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController firstnameController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final TextEditingController lastnameController = TextEditingController();
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 48.sp, bottom: 88.h),
                    child: SvgPicture.asset(
                      kCarrotAsset,
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AuthParagraph(
                            title: 'Sign Up',
                            subtitle: 'Enter your details to continue'),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            SizedBox(
                              width: 0.42.sw,
                              child: AuthTextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: 'First Name',
                                controller: firstnameController,
                                hintText: 'Enter your first name',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'First name is required';
                                  }
                                  if (!checkName(value)) {
                                    return 'Invalid name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 0.42.sw,
                              child: AuthTextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'First name is required';
                                  }
                                  if (!checkName(value)) {
                                    return 'Invalid name';
                                  }
                                  return null;
                                },
                                labelText: 'Last Name',
                                controller: lastnameController,
                                hintText: 'Enter your last name',
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 28.sp),
                          child: EmailTextFormField(
                            controller: emailController,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 28.sp),
                            child: PasswordWithChecker(
                              controller: passwordController,
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 8.sp, right: 8.sp, top: 20.sp),
                          child: const TermsOfConditions(),
                        ),
                        SizedBox(height: 18.h),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return const AuthLoadingButton();
                            }
                            return MainNormalButton(
                              text: 'Sign Up',
                              onPressed: () {
                                BlocProvider.of<AuthCubit>(context).register(
                                  firstnameController.text,
                                  lastnameController.text,
                                  emailController.text,
                                  passwordController.text,
                                  context,
                                  formKey,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  AuthRow(
                    startText: 'Already have an account?',
                    endText: 'Log in',
                    onPressed: () {
                      Navigator.pushNamed(context, kLoginScreen);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
