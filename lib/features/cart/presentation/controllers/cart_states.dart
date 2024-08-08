import 'package:simple_ecommerce/features/cart/data/models/cart.dart';

class CartState {}

class CartInitial extends CartState {}

class CartError extends CartState {
  final String message;

  CartError({required this.message});
}

class CartEmpty extends CartState {}

class CartLoaded extends CartState {
  final List<Cart> cart;

  CartLoaded({required this.cart});
}

class CartLoading extends CartState {}
