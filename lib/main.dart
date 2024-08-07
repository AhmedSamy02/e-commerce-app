import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/methods.dart';
import 'package:simple_ecommerce/core/constants/screens.dart';
import 'package:simple_ecommerce/features/auth/presentation/screens/login_screen.dart';
import 'package:simple_ecommerce/features/auth/presentation/screens/register_screen.dart';
import 'package:simple_ecommerce/features/home_screen.dart';
import 'package:simple_ecommerce/features/landing_screen.dart';

void main() {
  initializeLocators();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Gilroy',
        ),
        routes: {
          kLandingScreen: (context) => const LandingScreen(),
          kLoginScreen: (context) => const LoginScreen(),
          kHomeScreen: (context) => const HomeScreen(),
          kRegisterScreen: (context) => const RegisterScreen(),
        },
        initialRoute: kLoginScreen,
      ),
    );
  }
}
