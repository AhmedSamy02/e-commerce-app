import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';
import 'package:simple_ecommerce/features/cart/presentation/controllers/cart_cubit.dart';
import 'package:simple_ecommerce/features/shop/data/models/product.dart';

class RoundedAddToCartButton extends StatelessWidget {
  const RoundedAddToCartButton({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await BlocProvider.of<CartCubit>(context).addToCart(product, 1);
        Fluttertoast.showToast(
          msg: 'Added to cart successfully',
          backgroundColor: kMainGreen,
          textColor: Colors.white,
          fontSize: 16.sp,
        );
      },
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        backgroundColor: kMainGreen,
      ),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
