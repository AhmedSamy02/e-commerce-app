import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';
import 'package:simple_ecommerce/core/constants/widgets/auth_normal_button.dart';
import 'package:simple_ecommerce/features/cart/presentation/controllers/cart_cubit.dart';
import 'package:simple_ecommerce/features/cart/presentation/widgets/cart_list_body.dart';
import 'package:simple_ecommerce/features/cart/presentation/widgets/checkout_sheet.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key, required this.cart});
  final List cart;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CartListBody(
          cart: cart,
          preview: false,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 0.07.sh,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                boxShadow: [
                  BoxShadow(
                    color: kMainGreen,
                    spreadRadius: 4.r,
                    blurRadius: 12.r,
                    offset: Offset(0, 3.sp),
                  )
                ]),
            width: 0.8.sw,
            margin: EdgeInsets.only(bottom: 0.015.sh),
            child: MainNormalButton(
                text: 'Checkout',
                onPressed: () {
                  WoltModalSheet.show(
                    context: context,
                    barrierDismissible: true,
                    showDragHandle: false,
                    pageListBuilder: (bottomSheetContext) => [
                      SliverWoltModalSheetPage(
                        hasTopBarLayer: false,
                        mainContentSliversBuilder: (context) => [
                          SliverToBoxAdapter(
                            child: CheckoutSheet(
                              totalCost: BlocProvider.of<CartCubit>(context)
                                  .computeTotalCost(),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }
}
