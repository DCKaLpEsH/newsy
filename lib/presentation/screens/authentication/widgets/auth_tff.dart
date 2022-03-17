import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';

class AuthTFF extends StatelessWidget {
  const AuthTFF({
    Key? key,
    required this.focusNode,
    required this.controller,
    required this.hint,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.obscureCallback,
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController controller;
  final String hint;
  final Icon prefixIcon;
  final Icon? suffixIcon;
  final bool obscureText;
  final VoidCallback? obscureCallback;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 336.w,
      height: 56.h,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(
          color: AppColors.blackPrimary,
          fontSize: 16.sp,
          fontWeight: FontWeight.w900,
        ),
        cursorColor: AppColors.purplePrimary,
        cursorWidth: 3.0,
        decoration: InputDecoration(
          fillColor: AppColors.greyLighter,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.purplePrimary,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: GestureDetector(
            child: suffixIcon,
            onTap: obscureCallback,
          ),
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
