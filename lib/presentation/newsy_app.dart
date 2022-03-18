import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/presentation/screens/splash/splash_screen.dart';
import 'package:newsy/presentation/theme/app_colors.dart';
import 'package:newsy/presentation/theme/custom_material_color.dart';
import 'package:newsy/presentation/theme/theme_text.dart';

class Newsy extends StatefulWidget {
  const Newsy({Key? key}) : super(key: key);

  @override
  State<Newsy> createState() => NewsyState();
}

class NewsyState extends State<Newsy> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: ThemeText.appTextTheme(),
          scaffoldBackgroundColor: AppColors.scaffoldBg,
          primarySwatch: createMaterialColor(
            AppColors.purplePrimary,
          ),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: AppColors.greyPrimary,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        home: SplashScreen(),
      ),
      designSize: const Size(375, 812),
    );
  }
}
