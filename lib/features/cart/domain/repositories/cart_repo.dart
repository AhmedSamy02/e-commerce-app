import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/features/cart/data/models/cart.dart';

abstract class CartRepository {
  Future<Either<Failure,List<Cart>>>getCart();
}
