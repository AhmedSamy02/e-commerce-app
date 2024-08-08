import 'package:accordion/accordion.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:like_button/like_button.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';
import 'package:simple_ecommerce/core/constants/widgets/auth_normal_button.dart';
import 'package:simple_ecommerce/core/constants/widgets/items_count_row.dart';
import 'package:simple_ecommerce/features/shop/data/models/product.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    final controller = TextEditingController(text: '1');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 16.sp,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: product.id,
            child: SizedBox(
              height: 0.32.sh,
              child: PageView.builder(
                controller: pageController,
                itemCount: product.images.length,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: product.images[index],
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, progress) {
                      return const Center(
                        child: SpinKitThreeBounce(
                          color: kMainGreen,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: SmoothPageIndicator(
              controller: pageController,
              count: product.images.length,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: kMainGreen,
                dotHeight: 6.h,
                dotWidth: 6.w,
              ),
            ),
          ),
          /////////////////////////////////////////////////////////////////////
          SizedBox(
            height: 0.02.sh,
          ),
          /////////////////////////////////////////////////////////////////////
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        product.category.name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: LikeButton(
                    size: 30.sp,
                  ),
                ),
              ],
            ),
          ),
          /////////////////////////////////////////////////////////////////////
          SizedBox(
            height: 0.01.sh,
          ),
          /////////////////////////////////////////////////////////////////////
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemsCountRow(controller: controller),
                Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          /////////////////////////////////////////////////////////////////////
          SizedBox(
            height: 0.02.sh,
          ),
          /////////////////////////////////////////////////////////////////////
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.sp),
            child: Accordion(
                headerBackgroundColor: Colors.white,
                contentBorderColor: Colors.white,
                rightIcon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30.sp,
                ),
                flipRightIconIfOpen: true,
                scaleWhenAnimating: false,
                children: [
                  AccordionSection(
                      header: Text(
                        'Product Details',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      contentHorizontalPadding: 0,
                      content: SizedBox(
                        width: double.infinity,
                        child: Text(
                          product.description,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                ]),
          ),

          SizedBox(
            height: 0.02.sh,
          ),
          /////////////////////////////////////////////////////////////////////
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: MainNormalButton(
              text: 'Add to Basket',
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
