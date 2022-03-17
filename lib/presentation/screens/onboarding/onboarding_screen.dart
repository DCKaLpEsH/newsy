import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_controller.dart';
import 'package:flutter_carousel_widget/flutter_carousel_indicators.dart';
import 'package:flutter_carousel_widget/flutter_carousel_options.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/presentation/screens/onboarding/onboarding_screen_2.dart';
import 'package:newsy/presentation/theme/app_colors.dart';
import 'package:newsy/presentation/widgets/action_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late CarouselController _carouselController;
  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 120.h,
          ),
          SizedBox(
            height: 360.h,
            width: double.infinity,
            child: FlutterCarousel.builder(
              carouselController: _carouselController,
              itemCount: 3,
              itemBuilder: (context, index, i) {
                return _carouselItem(index);
              },
              options: CarouselOptions(
                enlargeCenterPage: true,
                initialPage: 1,
                aspectRatio: 1,
                enableInfiniteScroll: false,
                floatingIndicator: false,
                slideIndicator: const CircularSlideIndicator(
                  currentIndicatorColor: AppColors.purplePrimary,
                  indicatorBackgroundColor: AppColors.greyLighter,
                ),
                viewportFraction: 0.8,
              ),
            ),
          ),
          SizedBox(
            height: 34.h,
          ),
          Text(
            "First to know",
            style: GoogleFonts.sourceSansPro(
              fontSize: 24.sp,
              fontWeight: FontWeight.w900,
              color: AppColors.blackPrimary,
            ),
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
            text: "Next",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnboardingScreen2(),
                ),
              );
            },
            margin: 50.h,
          ),
        ],
      ),
    );
  }

  Widget _carouselItem(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.r),
      child: Container(
        height: 336.h,
        width: 288.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Image.asset(
          "assets/pngs/carousel_${index + 1}.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
