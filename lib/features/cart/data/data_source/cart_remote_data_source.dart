import 'package:dio/dio.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/features/cart/data/models/cart.dart';

abstract class CartRemoteDataSource {
  Future<void> checkout(List<Cart> cart);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio dio;

  CartRemoteDataSourceImpl({required this.dio});
  @override
  Future<void> checkout(List<Cart> cart) async {
    await dio.post('$kMainLink/checkout', data: {
      'cart': cart.map((e) => e.toJson()).toList(),
    });
  }
}
