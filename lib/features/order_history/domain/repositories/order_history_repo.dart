import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/features/order_history/data/models/order.dart';

abstract class OrderHistoryRepository {
  Future<Either<Failure, List<OrderModel>>> getOrders();
}
