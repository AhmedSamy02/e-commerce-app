import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/features/shop/data/models/product.dart';

abstract class ShopRepository {
  Future<Either<Failure,List<Product>>>getProducts(int page, int limit);
}