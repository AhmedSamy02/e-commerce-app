import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/core/errors/failure.dart';
import 'package:simple_ecommerce/core/errors/server_failure.dart';
import 'package:simple_ecommerce/core/errors/unexpected_failure.dart';
import 'package:simple_ecommerce/features/order_history/data/data_source/order_history_remote_data_source.dart';
import 'package:simple_ecommerce/features/order_history/data/models/order.dart';
import 'package:simple_ecommerce/features/order_history/domain/repositories/order_history_repo.dart';

class OrderHistoryRepositoryImpl implements OrderHistoryRepository {
  final OrderHistoryRemoteDataSource remoteDataSource;

  OrderHistoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders() async {
    try {
      final token =
          await getit.get<FlutterSecureStorage>().read(key: 'token') as String;
      final orders = await remoteDataSource.getOrders(token);
      return right(orders);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDio(e));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
