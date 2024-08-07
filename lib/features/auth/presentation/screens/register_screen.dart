import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';
import 'package:simple_ecommerce/core/constants/screens.dart';
import 'package:simple_ecommerce/core/constants/widgets/terms_of_conditions.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/auth_loading_button.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/auth_paragraph.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/auth_row.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/auth_text_form_field.dart';
import 'package:simple_ecommerce/features/auth/presentation/widgets/password_with_checker.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final TextEditingController firstnameController = TextEditingController();
    final TextEditingController lastnameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
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
                          title: 'Sign Up',
                          subtitle: 'Enter your details to continue'),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          SizedBox(
                            width: 0.42.sw,
                            child: AuthTextFormField(
                              labelText: 'First Name',
                              controller: firstnameController,
                              hintText: 'Enter your first name',
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 0.42.sw,
                            child: AuthTextFormField(
                              labelText: 'Last Name',
                              controller: lastnameController,
                              hintText: 'Enter your last name',
                            ),
                          ),
                        ],
                      ),
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
                          child: PasswordWithChecker(
                            controller: passwordController,
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 8.sp, right: 8.sp, top: 20.sp),
                        child: const TermsOfConditions(),
                      ),
                      SizedBox(height: 18.h),
                      const AuthLoadingButton(),
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
    );
  }
}
