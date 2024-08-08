import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          kGroceriesAsset,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10.h),
        Text(
          'Something went wrong',
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          message,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
