import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();
    final appBar = [
      AppBar(
        title: Text(
          'Shop',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
          ),
        ),
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
        centerTitle: true,
      ),
      null
    ];
    final List<Widget> homeBodies = [
      Placeholder(),
      Placeholder(),
      Placeholder(),
    ];
    return Scaffold(
      appBar: appBar[_currentIndex],
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        children: homeBodies,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: kMainGreen,
        onTap: (index) async {
          await _pageController.animateToPage(index,
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
            label: 'Profile',
            activeIcon: SvgPicture.asset(kProfileAsset, color: kMainGreen),
          ),
        ],
      ),
    );
  }
}
