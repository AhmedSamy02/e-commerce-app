import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ecommerce/core/constants/assets.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';
import 'package:simple_ecommerce/core/constants/screens.dart';
import 'package:simple_ecommerce/core/constants/values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final isLogged =
          await getit.get<FlutterSecureStorage>().containsKey(key: 'token');
      if (isLogged) {
        Navigator.pushReplacementNamed(context, kHomeScreen);
        return;
      } else {
        Navigator.pushReplacementNamed(context, kLandingScreen);
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainGreen,
      body: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(kWhiteCarrotAsset),
              Padding(
                padding: EdgeInsets.only(left: 14.sp),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 45.h,
                        child: Text(
                          'AUVNET',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 44.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        'o n l i n e  g r o c e r i e s',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.sp,
                        ),
                      ),
                    ]),
              )
            ].animate().blur(
                duration: 1.seconds,
                begin: const Offset(30, 30),
                end: const Offset(0, 0))),
      ),
    );
  }
}
