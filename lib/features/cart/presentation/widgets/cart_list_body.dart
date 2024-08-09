import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/features/cart/presentation/widgets/cart_item.dart';

class CartListBody extends StatelessWidget {
  const CartListBody({
    super.key,
    required this.cart, required this.preview,
  });

  final List cart;
  final bool preview;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[400],
          thickness: 1.sp,
          height: 42.h,
        );
      },
      padding: EdgeInsets.only(bottom: 0.11.sh, top: 0.03.sh),
      itemCount: cart.length,
      itemBuilder: (context, index) {
        return CartItem(
          cart: cart[index],
          preview: preview,
        );
      },
    );
  }
}
