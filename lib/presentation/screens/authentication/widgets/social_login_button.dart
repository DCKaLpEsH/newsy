import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    required this.onPressed,
    required this.prefixIcon,
    required this.title,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Widget prefixIcon;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyLighter,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: prefixIcon,
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
              child: title,
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}
