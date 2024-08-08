import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';

class RoundedAddToCartButton extends StatelessWidget {
  const RoundedAddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kMainGreen,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: const Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
