import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';
import 'package:simple_ecommerce/core/constants/screens.dart';
import 'package:simple_ecommerce/features/order_history/data/models/order.dart';
import 'package:simple_ecommerce/features/order_history/presentation/controllers/order_history_cubit.dart';
import 'package:simple_ecommerce/features/order_history/presentation/controllers/order_history_state.dart';

import '../widgets/date_row.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final statusColors = {
      'Delivered': Colors.green,
      'Pending': Colors.orange,
      'Cancelled': Colors.red,
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order History',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
          ),
        ),
        toolbarHeight: 0.04.sh,
        centerTitle: true,
      ),
      body: BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
        builder: (context, state) {
          if (state is OrderHistoryLoading) {
            return const Center(
              child: SpinKitWaveSpinner(color: kMainGreen),
            );
          }
          if (state is OrderHistoryError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is OrderHistoryInitial) {
            BlocProvider.of<OrderHistoryCubit>(context).getOrders();
            return const Center(
              child: SpinKitWaveSpinner(color: kMainGreen),
            );
          }

          if (state is OrderHistoryLoaded) {
            return ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  final order = state.orders[index];
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.sp, vertical: 4.sp),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, kOrderDetailsScreen,
                            arguments: order);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('#${order.id}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.sp,
                                    )),
                                const Spacer(),
                                Text('\$${order.totalPrice}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp,
                                    )),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(order.status,
                                      style: TextStyle(
                                        color: statusColors[order.status],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp,
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.sp),
                              child: DateRow(
                                date: order.createdAt,
                                text: 'Created ',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.sp),
                              child: DateRow(
                                date: order.doneAt,
                                text: 'Updated',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
