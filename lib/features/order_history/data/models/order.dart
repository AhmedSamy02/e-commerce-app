import 'package:simple_ecommerce/features/cart/data/models/cart.dart';

class OrderModel {
  final String id;
  final DateTime createdAt;
  final DateTime doneAt;
  final String status;
  final double totalPrice;
  final List<Cart> cart;

  OrderModel(
      {required this.id,
      required this.createdAt,
      required this.doneAt,
      required this.status,
      required this.totalPrice,
      required this.cart});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        id: json['id'],
        createdAt: DateTime.parse(json['createdAt']),
        doneAt: DateTime.parse(json['doneAt']),
        status: json['status'],
        totalPrice: json['totalPrice'],
        cart:
            (json['cart'] as List).map((cart) => Cart.fromJson(cart)).toList());
  }
}
