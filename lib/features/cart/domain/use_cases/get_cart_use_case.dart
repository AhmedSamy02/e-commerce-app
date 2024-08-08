import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/core/use_cases/use_case.dart';
import 'package:simple_ecommerce/features/cart/data/models/cart.dart';
import 'package:simple_ecommerce/features/cart/domain/repositories/cart_repo.dart';

class GetCartUseCase implements UseCase<List<Cart>> {
  final CartRepository cartRepository;

  GetCartUseCase({required this.cartRepository});
  @override
  Future<Either<Failure, List<Cart>>> call() async {
    return await cartRepository.getCart();
  }
}
