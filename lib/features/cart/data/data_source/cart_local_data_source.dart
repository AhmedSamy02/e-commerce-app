import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/features/cart/data/models/cart.dart';

abstract class CartLocalDataSource {
  Future<List<Cart>> getCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  @override
  Future<List<Cart>> getCart() async {
    List<Cart> cart = [];
    cart = Hive.box<Cart>(kCartBox).values.toList();
    return cart;
  }
}
