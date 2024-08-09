import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';
import 'package:simple_ecommerce/features/cart/presentation/controllers/cart_cubit.dart';
import 'package:simple_ecommerce/features/cart/presentation/controllers/cart_states.dart';
import 'package:simple_ecommerce/features/cart/presentation/screens/cart_error_screen.dart';
import 'package:simple_ecommerce/features/cart/presentation/screens/empty_cart_screen.dart';
import 'package:simple_ecommerce/features/cart/presentation/widgets/cart_list_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartEmpty) {
          return const EmptyCartScreen();
        }
        if (state is CartLoading) {
          return const Center(
            child: SpinKitWaveSpinner(color: kMainGreen),
          );
        }
        if (state is CartError) {
          return CartErrorScreen(message: state.message);
        }
        if (state is CartLoaded) {
          return CartListWidget(cart: state.cart);
        }
        if (state is CheckoutLoading) {
          return CartListWidget(cart: state.cart);
        }
        return const SizedBox();
      },
    );
  }
}
