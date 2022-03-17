import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsy/presentation/screens/authentication/login_screen.dart';
import 'package:newsy/presentation/screens/home/home_screen.dart';
import 'package:newsy/presentation/widgets/action_button.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 154.h,
          ),
          Image.asset(
            "assets/pngs/handshake.png",
            fit: BoxFit.cover,
          ),
          SvgPicture.asset(
            "assets/svgs/logo_dark.svg",
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 79.w,
              vertical: 24.h,
            ),
            child: Text(
              "All news in one place, be the first to know last news",
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          ActionButton(
            text: "Get Started",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            margin: 50.h,
          ),
        ],
      ),
    );
  }
}
