import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField(
      {super.key,
      required this.labelText,
      this.hintText,
      required this.controller,
      this.validator,
      this.autovalidateMode});
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      validator: validator,
      controller: controller,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.green[900],
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        floatingLabelStyle: TextStyle(
          color: Colors.green[900],
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.sp,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.sp,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Colors.green[900]!,
            width: 2.sp,
          ),
        ),
        hintStyle: const TextStyle(color: Colors.black45),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: Colors.green[900]!,
            width: 1.sp,
          ),
        ),
      ),
    );
  }
}
