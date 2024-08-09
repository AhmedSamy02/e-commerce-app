import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';
import 'package:simple_ecommerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:simple_ecommerce/features/settings/presentation/screens/settings_screen.dart';
import 'package:simple_ecommerce/features/shop/presentation/screens/shop_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final appBar = [
      AppBar(
        title: Text(
          'Shop',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
          ),
        ),
        toolbarHeight: 0.04.sh,
        centerTitle: true,
      ),
      AppBar(
        title: Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
          ),
        ),
        toolbarHeight: 0.04.sh,
        centerTitle: true,
      ),
      null
    ];
    final List<Widget> homeBodies = [
      const ShopScreen(),
      const CartScreen(),
      const SettingsScreen(),
    ];
    return Scaffold(
      appBar: appBar[_currentIndex],
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        children: homeBodies,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        currentIndex: _currentIndex,
        selectedItemColor: kMainGreen,
        onTap: (index) async {
          await pageController.animateToPage(index,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kShopAsset),
            label: 'Shop',
            activeIcon: SvgPicture.asset(kShopAsset, color: kMainGreen),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kCartAsset),
            label: 'Cart',
            activeIcon: SvgPicture.asset(kCartAsset, color: kMainGreen),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kProfileAsset),
            label: 'Account',
            activeIcon: SvgPicture.asset(kProfileAsset, color: kMainGreen),
          ),
        ],
      ),
    );
  }
}
