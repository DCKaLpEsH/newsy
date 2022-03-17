import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsy/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:newsy/presentation/theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (value) async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
        );
      },
    );
    return Scaffold(
      backgroundColor: AppColors.purplePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svgs/logo.svg",
            ),
            SizedBox(
              height: 24.h,
            ),
            SvgPicture.asset(
              "assets/svgs/app_name.svg",
            ),
          ],
        ),
      ),
    );
  }
}
