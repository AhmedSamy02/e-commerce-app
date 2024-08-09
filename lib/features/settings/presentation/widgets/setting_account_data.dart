import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';

class SettingsAccountData extends StatelessWidget {
  const SettingsAccountData({
    super.key, required this.firstName, required this.lastName, required this.email,
  });
  final String firstName;
  final String lastName;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey)),
          child: Center(
            child: SvgPicture.asset(
              kProfileAsset,
              width: 30.w,
              height: 30.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                    child: Text(
                      '$firstName $lastName',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Icon(
                      Icons.edit_outlined,
                      size: 18.sp,
                      color: kMainGreen,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                email,
                style: TextStyle(fontSize: 12.sp, color: Colors.black45),
              )
            ],
          ),
        ),
      ],
    );
  }
}
