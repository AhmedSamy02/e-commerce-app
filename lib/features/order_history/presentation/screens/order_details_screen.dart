import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/features/cart/presentation/widgets/cart_list_body.dart';
import 'package:simple_ecommerce/features/order_history/data/models/order.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context)!.settings.arguments as OrderModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
          ),
        ),
        toolbarHeight: 0.04.sh,
        centerTitle: true,
      ),
      body: CartListBody(cart: order.cart , preview: true),
    );
  }
}