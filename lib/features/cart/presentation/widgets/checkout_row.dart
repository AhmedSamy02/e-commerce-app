import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutRow extends StatelessWidget {
  const CheckoutRow({super.key, required this.leading, required this.trailing});
  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(leading,
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black38,
                fontWeight: FontWeight.bold)),
        const Spacer(),
        Text(
          trailing,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 6.w,
        ),
        Icon(Icons.arrow_forward_ios, size: 15.sp),
      ],
    );
  }
}
