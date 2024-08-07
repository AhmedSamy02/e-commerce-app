import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';

class AuthRow extends StatelessWidget {
  const AuthRow(
      {super.key,
      required this.startText,
      required this.endText,
      this.onPressed});
  final String startText;
  final String endText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          startText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(0.sp),
          ),
          child: Text(
            endText,
            style: const TextStyle(
              color: kMainGreen,
            ),
          ),
        )
      ],
    );
  }
}
