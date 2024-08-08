import 'package:dio/dio.dart';
import 'package:simple_ecommerce/core/constants/methods.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/features/shop/data/models/product.dart';

abstract class ShopRemoteDataSource {
  Future<List<Product>> getProducts(int page, int limit);
}

class ShopRemoteDataSourceImpl implements ShopRemoteDataSource {
  final Dio dio;
  final String endpoint = '/products';
  ShopRemoteDataSourceImpl({required this.dio});
  @override
  Future<List<Product>> getProducts(int page, int limit) async {
    final response = await dio.get(
      kProductsLink + endpoint,
      queryParameters: {
        'offset': page,
        'limit': limit,
      },
    );
    final List<Product> products = [];
    for (final product in response.data) {
      products.add(Product.fromJson(product));
    }
    saveToProducts(products, kShopBox);
    return products;
  }
}
