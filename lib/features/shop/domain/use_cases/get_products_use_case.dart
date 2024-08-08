import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/core/use_cases/use_case_with_params.dart';
import 'package:simple_ecommerce/features/shop/data/models/product.dart';
import 'package:simple_ecommerce/features/shop/domain/repositories/shop_repo.dart';

class GetProductsUseCase
    implements UseCaseWithTwoParams<List<Product>, int, int> {
  final ShopRepository repository;

  GetProductsUseCase({required this.repository});
  @override
  Future<Either<Failure, List<Product>>> call(int page, int limit) async {
    return repository.getProducts(page, limit);
  }
}
