import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.margin,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final double? margin;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56.h,
        width: 336.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.purplePrimary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.only(bottom: margin ?? 0),
        // padding: EdgeInsets.symmetric(
        //   horizontal: 151.w,
        //   vertical: 16.h,
        // ),
        child: Text(
          text,
          style: GoogleFonts.sourceSansPro(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
