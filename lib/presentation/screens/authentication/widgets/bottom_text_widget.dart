import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';

class BottomText extends StatelessWidget {
  const BottomText({
    Key? key,
    required this.title,
    required this.action,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String action;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "$title ",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: AppColors.blackLighter,
                    ),
              ),
              TextSpan(
                text: "Sign Up",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: AppColors.blackPrimary,
                    ),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
