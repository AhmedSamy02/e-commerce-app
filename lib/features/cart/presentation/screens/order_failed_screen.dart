import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';
import 'package:simple_ecommerce/core/constants/widgets/auth_normal_button.dart';

class OrderFailedScreen extends StatelessWidget {
  const OrderFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kFailedAsset),
            SizedBox(
              width: 0.8.sw,
              child: Text(
                textAlign: TextAlign.center,
                'Your Order cannot be processed',
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
              height: 0.2.sh,
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black38,
                ),
              ),
            ),
            SizedBox(
              height: 0.2.sh,
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
