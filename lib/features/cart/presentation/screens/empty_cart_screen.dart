import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

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
            kFailedAlertAsset,
            height: 0.3.sh,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Looks like you haven\'t added anything to your cart yet',
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
