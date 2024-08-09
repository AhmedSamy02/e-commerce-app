import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/features/order_history/domain/repositories/order_history_repo.dart';
import 'package:simple_ecommerce/features/order_history/domain/use_cases/get_orders_use_case.dart';
import 'package:simple_ecommerce/features/order_history/presentation/controllers/order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit() : super(OrderHistoryInitial());

  Future<void> getOrders() async {
    emit(OrderHistoryLoading());
    final result =
        await GetOrdersUseCase(repository: getit.get<OrderHistoryRepository>())
            .call();
    result.fold(
      (failure) => emit(OrderHistoryError(message: failure.message)),
      (orders) => emit(OrderHistoryLoaded(orders: orders)),
    );
  }
}
