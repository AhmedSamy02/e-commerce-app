import 'package:hive/hive.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/features/shop/data/models/product.dart';

abstract class ShopLocalDataSource {
  Future<List<Product>> getProducts(int page, int limit);
}

class ShopLocalDataSourceImpl implements ShopLocalDataSource {
  @override
  Future<List<Product>> getProducts(int page, int limit) async {
    int start = page * 10;
    int end = (page + 1) * 10;
    var box = Hive.box<Product>(kShopBox);
    int length = box.values.length;
    if (start >= length || end > length) {
      return [];
    }
    return box.values.toList().sublist(start, end);
  }
}
