import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/core/errors/unexpected_failure.dart';
import 'package:simple_ecommerce/features/cart/data/data_source/cart_local_data_source.dart';
import 'package:simple_ecommerce/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:simple_ecommerce/features/cart/data/models/cart.dart';
import 'package:simple_ecommerce/features/cart/domain/repositories/cart_repo.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource cartLocalDataSource;
  final CartRemoteDataSource cartRemoteDataSource;
  CartRepositoryImpl(
      {required this.cartLocalDataSource, required this.cartRemoteDataSource});
  @override
  Future<Either<Failure, List<Cart>>> getCart() async {
    try {
      return right(await cartLocalDataSource.getCart());
    } catch (e) {
      return left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Either<Failure, void> saveCart(List<Cart> cart) {
    try {
      cartLocalDataSource.saveCart(cart);
      return right(null);
    } catch (e) {
      return left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> checkout(List<Cart> cart) async{
    try {
      await cartRemoteDataSource.checkout(cart);
      return right(null);
    } catch (e) {
      return left(UnexpectedFailure(message: e.toString()));
    }
  }
}
