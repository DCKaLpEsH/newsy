import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/presentation/theme/app_colors.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme appTextTheme() => GoogleFonts.sourceSansProTextTheme(
        TextTheme(
          headline1: _whiteHeadline1,
          headline3: _whiteHeadline3,
          headline4: _blackHeadline4,
          headline5: _greyHeadline5,
          headline6: _blackHeadline6,
          bodyText1: _blackBodyText1,
          bodyText2: _greyBodyText2,
          subtitle1: _greySubtitle1,
          subtitle2: _whiteSubtitle2,
          caption: _greyCaption,
        ),
      );

  static TextStyle? get _greyBodyText2 => TextStyle(
        color: AppColors.greyDark,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      );

  static TextStyle? get _blackBodyText1 => TextStyle(
        color: AppColors.blackPrimary,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      );

  static TextStyle? get _whiteHeadline3 => TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      );

  static TextStyle? get _blackHeadline6 => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w900,
        color: AppColors.blackPrimary,
      );

  static TextStyle? get _greyHeadline5 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w900,
        color: AppColors.greyPrimary,
      );

  static TextStyle? get _blackHeadline4 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 21, 28, 68),
      );

  static TextStyle? get _whiteHeadline1 => TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        height: 1.2,
      );

  static TextStyle? get _greySubtitle1 => TextStyle(
        fontSize: 16.sp,
        color: AppColors.greyPrimary,
      );

  static TextStyle? get _whiteSubtitle2 => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      );
  static TextStyle? get _greyCaption => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.greyPrimary,
      );
}
