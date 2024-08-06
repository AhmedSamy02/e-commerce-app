import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/screens.dart';
import 'package:simple_ecommerce/features/landing_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Gilroy',
          
        ),
        routes: {
          kLandingScreen: (context) => const LandingScreen(),
        },
        initialRoute: kLandingScreen,
      ),
    );
  }
}
