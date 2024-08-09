import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';
import 'package:simple_ecommerce/core/constants/screens.dart';
import 'package:simple_ecommerce/core/constants/widgets/auth_normal_button.dart';
import 'package:simple_ecommerce/core/constants/widgets/list_tile_row.dart';
import 'package:simple_ecommerce/core/constants/widgets/main_text_form_field.dart';
import 'package:simple_ecommerce/features/profile/presentation/controllers/profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ProfileCubit>(context);
    final firstNameController = controller.firstNameController;
    final lastNameController = controller.lastNameController;
    final emailController = controller.emailController;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(kGroceriesAsset),
              Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: IconButton(
                    padding: EdgeInsets.only(
                      left: 18.sp,
                    ),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(18.sp),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MainTextFormField(
                        labelText: 'Firstname',
                        controller: firstNameController,
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Expanded(
                        child: MainTextFormField(
                            labelText: 'Lastname',
                            controller: lastNameController)),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                MainTextFormField(
                  controller: emailController,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  enabled: false,
                ),
                SizedBox(
                  height: 18.h,
                ),
                ListTileRow(
                    icon: kPasswordIconAsset,
                    title: 'Password',
                    iconWidth: 20.w,
                    iconHeight: 20.h,
                    onTap: () {
                      Navigator.pushNamed(context, kChangePasswordScreen);
                    }),
                SizedBox(
                  height: 0.2.sh,
                ),
                MainNormalButton(
                  text: 'Apply',
                  onPressed: () async {
                    await BlocProvider.of<ProfileCubit>(context)
                        .updateProfile(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
