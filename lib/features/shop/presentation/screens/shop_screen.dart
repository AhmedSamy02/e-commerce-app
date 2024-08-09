import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';
import 'package:simple_ecommerce/features/shop/data/models/product.dart';
import 'package:simple_ecommerce/features/shop/presentation/controllers/shop_cubit.dart';
import 'package:simple_ecommerce/features/shop/presentation/widgets/product_grid_item.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    BlocProvider.of<ShopCubit>(context).initializePaging();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.sp),
      child: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => BlocProvider.of<ShopCubit>(context).pagingController.refresh(),
        ),
        color: kMainGreen,
        child: PagedGridView(
          pagingController:
              BlocProvider.of<ShopCubit>(context).pagingController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14.h,
            crossAxisSpacing: 38.w,
            childAspectRatio: 0.58.sp,
          ),
          builderDelegate: PagedChildBuilderDelegate<Product>(
            firstPageProgressIndicatorBuilder: (context) => const Center(
              child: SpinKitFadingCircle(color: kMainGreen),
            ),
            noItemsFoundIndicatorBuilder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(kFailedAlertAsset),
                SizedBox(height: 24.h),
                Text(
                  'No items found',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            itemBuilder: (context, item, index) =>
                ProductGridItem(product: item),
          ),
        ),
      ),
    );
  }
}
