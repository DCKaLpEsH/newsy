import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: 12.sp,
              ),
        ),
        decoration: BoxDecoration(
          color: AppColors.greyLighter,
          borderRadius: BorderRadius.circular(16.w),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 16.w,
        ),
      ),
    );
  }
}
