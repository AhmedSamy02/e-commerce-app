import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/core/errors/server_failure.dart';
import 'package:simple_ecommerce/core/errors/unexpected_failure.dart';
import 'package:simple_ecommerce/features/shop/data/data_source/shop_local_data_source.dart';
import 'package:simple_ecommerce/features/shop/data/data_source/shop_remote_data_source.dart';
import 'package:simple_ecommerce/features/shop/data/models/product.dart';
import 'package:simple_ecommerce/features/shop/domain/repositories/shop_repo.dart';

class ShopRepositoryImpl implements ShopRepository {
  final ShopRemoteDataSource remoteDataSource;
  final ShopLocalDataSource localDataSource;

  ShopRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});
  @override
  Future<Either<Failure, List<Product>>> getProducts(
      int page, int limit) async {
    List<Product> products;
    try {
      products = await localDataSource.getProducts(page, limit);
      if (products.isNotEmpty) {
        return right(products);
      }
      products = await remoteDataSource.getProducts(page, limit);
      return right(products);
    } on DioException catch (e) {
      return left(ServerFailure.fromDio(e));
    } catch (e) {
      return left(UnexpectedFailure(message: e.toString()));
    }
  }
}
