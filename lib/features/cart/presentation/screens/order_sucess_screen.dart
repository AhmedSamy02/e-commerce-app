import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';
import 'package:simple_ecommerce/core/constants/widgets/auth_normal_button.dart';

class OrderSucessScreen extends StatelessWidget {
  const OrderSucessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kSucessAsset),
            SizedBox(
              width: 0.8.sw,
              child: Text(
                textAlign: TextAlign.center,
                'Your Order has been accepted',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            SizedBox(
              width: 0.75.sw,
              child: Text(
                'Your items has been placed and is on its way to being processed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black38,
                ),
              ),
            ),
            SizedBox(
              height: 0.3.sh,
            ),
            SizedBox(
              width: 0.8.sw,
              child: MainNormalButton(
                text: 'Back To Home',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
