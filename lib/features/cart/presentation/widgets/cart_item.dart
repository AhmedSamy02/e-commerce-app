import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';
import 'package:simple_ecommerce/core/constants/screens.dart';
import 'package:simple_ecommerce/core/constants/widgets/items_count_row.dart';
import 'package:simple_ecommerce/features/cart/data/models/cart.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cart});
  final Cart cart;
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: cart.quantity.toString());
    return Padding(
      padding: EdgeInsets.only(
        left: 14.sp,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            kProductDetailsScreen,
            arguments: {
              'product': cart.product,
              'controller': controller,
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
                      imageUrl: cart.product.images[0],
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
                  padding: EdgeInsets.only(left: 10.sp),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cart.product.title,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                cart.product.category.name,
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.close,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemsCountRow(
                            controller: controller,
                            onChanged: (value) {
                              cart.quantity = int.parse(value);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 12.sp),
                            child: Text(
                              '\$${cart.product.price}',
                              style: TextStyle(
                                fontSize: 15.sp,
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
