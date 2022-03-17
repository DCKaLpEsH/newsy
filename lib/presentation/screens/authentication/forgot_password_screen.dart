import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/presentation/screens/authentication/otp_screen.dart';
import 'package:newsy/presentation/screens/authentication/widgets/authentication_text_form_field.dart';
import 'package:newsy/presentation/widgets/action_button.dart';

import '../../theme/app_colors.dart';
import 'widgets/bottom_text_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late FocusNode emailFn;
  late TextEditingController emailController;
  Color emailIconColor = AppColors.greyPrimary;
  @override
  void initState() {
    super.initState();
    emailFn = FocusNode();
    emailController = TextEditingController();
    emailFn.addListener(() {
      if (emailFn.hasFocus) {
        emailIconColor = AppColors.purplePrimary;
      } else {
        emailIconColor = AppColors.greyPrimary;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
          FocusNode(),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot Password 🤔",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "We need your email adress so we can send you the password reset code.",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
                height: 32.h,
              ),
              TextFormField(
                controller: emailController,
                focusNode: emailFn,
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
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: emailIconColor,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  hintText: "Enter Email Address",
                  hintStyle: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              ActionButton(
                text: "Next",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OTPScreen(),
                    ),
                  );
                },
              ),
              const Spacer(),
              BottomText(
                title: "Remember the password?",
                action: "Try again",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
