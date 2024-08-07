import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';

class TermsOfConditions extends StatelessWidget {
  const TermsOfConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text.rich(TextSpan(
            text: 'By continuing, you agree to our ',
            style: TextStyle(fontSize: 14.sp, color: Colors.black54),
            children: <TextSpan>[
          TextSpan(
              text: 'Terms of Service',
              style: TextStyle(
                fontSize: 13.sp,
                color: kMainGreen,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //TODO: Add Terms of Service Here
                }),
          TextSpan(
              text: ' and ',
              style: TextStyle(fontSize: 14.sp, color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kMainGreen,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //TODO: Add Privacy Policy Here
                      })
              ])
        ])));
  }
}
