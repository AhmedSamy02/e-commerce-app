import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';
import 'package:simple_ecommerce/core/constants/screens.dart';
import 'package:simple_ecommerce/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:simple_ecommerce/features/auth/presentation/controllers/auth_states.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/auth_loading_button.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/auth_normal_button.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/auth_paragraph.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/auth_row.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/password_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                          title: 'Login',
                          subtitle: 'Enter your email and password'),
                      Padding(
                        padding: EdgeInsets.only(top: 28.sp),
                        child: AuthTextFormField(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          controller: emailController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 28.sp),
                        child: PasswordTextFormField(
                          textInputAction: TextInputAction.done,
                          controller: passwordController,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return const AuthLoadingButton();
                          }
                          return AuthNormalButton(
                            text: 'Login',
                            onPressed: () {
                              BlocProvider.of<AuthCubit>(context).login(
                                emailController.text,
                                passwordController.text,
                                context,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                AuthRow(
                  startText: 'Don\'t have an account?',
                  endText: 'Sign Up',
                  onPressed: () {
                    Navigator.pushNamed(context, kRegisterScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
