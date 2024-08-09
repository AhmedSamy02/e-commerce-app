import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class PasswordTextFormFieldWithConfirm extends StatefulWidget {
  const PasswordTextFormFieldWithConfirm(
      {super.key, required this.controller, required this.confirmController});
  final TextEditingController controller;

  final TextEditingController confirmController;
  @override
  State<PasswordTextFormFieldWithConfirm> createState() =>
      _PasswordTextFormFieldWithConfirmState();
}

class _PasswordTextFormFieldWithConfirmState
    extends State<PasswordTextFormFieldWithConfirm> {
  bool obscureText = true;
  bool obscureTextConfirm = true;
  @override
  Widget build(BuildContext context) {
    return PasswordStrengthFormChecker(
      needConfirmation: true,
      confirmationTextFormFieldConfiguration: TextFormFieldConfiguration(
        textInputAction: TextInputAction.done,
        controller: widget.controller,
        obscureText: obscureTextConfirm,
        decoration: InputDecoration(
          labelText: 'Confirm Password',
          hintText: 'Confirm your password',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureTextConfirm = !obscureTextConfirm;
              });
            },
            icon: Icon(
              obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.grey[600],
            ),
          ),
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
      ),
      showGenerator: true,
      generateButtonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      textFormFieldConfiguration: TextFormFieldConfiguration(
        textInputAction: TextInputAction.next,
        controller: widget.controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: 'New Password',
          hintText: 'Enter your password',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.grey[600],
            ),
          ),
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
      ),
      minimumStrengthRequired: PasswordStrength.secure,
      onChanged: (password, notifier) {
        notifier.value = PasswordStrength.calculate(text: password);
      },
    );
  }
}
