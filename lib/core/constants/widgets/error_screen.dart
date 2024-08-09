import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(28.sp),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Image.asset(
            kCartErrorAsset,
            height: 0.3.sh,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Oops! There was an error',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            message,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
