import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class PasswordWithChecker extends StatefulWidget {
  const PasswordWithChecker({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<PasswordWithChecker> createState() => _PasswordWithCheckerState();
}

class _PasswordWithCheckerState extends State<PasswordWithChecker> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return PasswordStrengthFormChecker(
      textFormFieldConfiguration: TextFormFieldConfiguration(
        textInputAction: TextInputAction.done,
        controller: widget.controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: 'Password',
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
