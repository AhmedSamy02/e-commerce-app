import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';
import 'package:simple_ecommerce/core/constants/screens.dart';
import 'package:simple_ecommerce/core/constants/widgets/items_count_row.dart';
import 'package:simple_ecommerce/features/cart/data/models/cart.dart';
import 'package:simple_ecommerce/features/cart/presentation/controllers/cart_cubit.dart';

class CartItem extends StatefulWidget {
  CartItem({super.key, required this.cart, required this.preview});
  Cart cart;
  final bool preview;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: widget.cart.quantity.toString());
    return Padding(
      padding: EdgeInsets.only(
        left: 14.sp,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            kProductDetailsScreen,
            arguments: {
              'product': widget.cart.product,
              'controller': null,
            },
          );
        },
        child: SizedBox(
          height: 0.15.sh,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.r),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.cart.product.images[0],
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) {
                        return Center(
                            child: SpinKitThreeBounce(
                          color: kMainGreen,
                          size: 20.sp,
                        ));
                      },
                      errorWidget: (context, url, error) {
                        return const Center(
                          child: Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.sp),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 0.55.sw,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.cart.product.title,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                ),
                                Text(
                                  widget.cart.product.category.name,
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          !widget.preview
                              ? IconButton(
                                  onPressed: () {
                                    BlocProvider.of<CartCubit>(context)
                                        .removeCartItem(widget.cart);
                                    Fluttertoast.showToast(
                                      msg:
                                          'Item removed from cart successfully',
                                      backgroundColor: Colors.green[900],
                                      textColor: Colors.white,
                                      fontSize: 14.sp,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.grey,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          !widget.preview? ItemsCountRow(
                            controller: controller,
                            onChanged: (value) {
                              BlocProvider.of<CartCubit>(context)
                                  .changeQunatity(
                                      widget.cart, int.parse(value));
                            },
                          ):const SizedBox(),
                          Padding(
                            padding: EdgeInsets.only(right: 12.sp),
                            child: Text(
                              '${widget.preview?'${widget.cart.quantity}x ':''} \$${widget.cart.product.price * int.parse(controller.text)}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
