import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/core/use_cases/use_case.dart';
import 'package:simple_ecommerce/features/order_history/data/models/order.dart';
import 'package:simple_ecommerce/features/order_history/domain/repositories/order_history_repo.dart';

class GetOrdersUseCase extends UseCase<List<OrderModel>> {
  final OrderHistoryRepository repository;

  GetOrdersUseCase({required this.repository});
  @override
  Future<Either<Failure, List<OrderModel>>> call() async {
    return await repository.getOrders();
  }
}
