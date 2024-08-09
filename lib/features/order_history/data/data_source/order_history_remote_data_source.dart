import 'package:dio/dio.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/features/order_history/data/models/order.dart';

abstract class OrderHistoryRemoteDataSource {
  Future<List<OrderModel>> getOrders(String token);
}

class OrderHistoryRemoteDataSourceImpl implements OrderHistoryRemoteDataSource {
  final Dio dio;

  OrderHistoryRemoteDataSourceImpl({required this.dio});
  final endpoint = '/orders';
  @override
  Future<List<OrderModel>> getOrders(String token) async {
    final response = await dio.get(
      kMainLink + endpoint,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return response.data['data']
        .map<OrderModel>((order) => OrderModel.fromJson(order))
        .toList();
  }
}
