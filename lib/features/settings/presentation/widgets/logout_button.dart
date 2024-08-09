import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          
          foregroundColor: kMainGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.logout),
            const Spacer(),
            Text('Logout',style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
