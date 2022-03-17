import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/presentation/screens/authentication/forgot_password_screen.dart';
import 'package:newsy/presentation/screens/authentication/widgets/bottom_text_widget.dart';
import 'package:newsy/presentation/screens/home/home_screen.dart';
import 'package:newsy/presentation/theme/app_colors.dart';
import 'package:newsy/presentation/widgets/action_button.dart';

import 'widgets/authentication_text_form_field.dart';
import 'widgets/social_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FocusNode scaffoldFn, emailFn, passwordFn;
  // late FocusScopeNode emailFSN;
  late TextEditingController emailController, passwordController;
  Color emailIconColor = AppColors.greyPrimary;
  Color passwordIconColor = AppColors.greyPrimary;
  bool obscure = false;

  @override
  void initState() {
    super.initState();
    scaffoldFn = FocusNode();
    emailFn = FocusNode();
    passwordFn = FocusNode();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailFn.addListener(() {
      if (emailFn.hasFocus) {
        emailIconColor = AppColors.purplePrimary;
      } else {
        emailIconColor = AppColors.greyPrimary;
      }
      setState(() {});
    });
    passwordFn.addListener(changeColor);
  }

  void changeColor() {
    if (passwordFn.hasFocus) {
      passwordIconColor = AppColors.purplePrimary;
    } else {
      passwordIconColor = AppColors.greyPrimary;
    }
    setState(() {});
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFn.dispose();
    passwordController.dispose();
    passwordFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back 👋",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "I am happy to see you again. You can continue where you left off by logging in",
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
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: emailIconColor,
                  ),
                  hintText: "Email Address",
                  hintStyle: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              AuthenticationTextFormField(
                focusNode: passwordFn,
                controller: passwordController,
                hint: "Password",
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: passwordIconColor,
                ),
                obscureText: obscure,
                suffixIcon: obscure
                    ? Icon(
                        Icons.visibility_outlined,
                        color: passwordIconColor,
                      )
                    : Icon(
                        Icons.visibility_off_outlined,
                        color: passwordIconColor,
                      ),
                obscureCallback: () {
                  setState(
                    () {
                      obscure = !obscure;
                    },
                  );
                },
              ),
              SizedBox(
                height: 12.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ActionButton(
                text: "Sign In",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Text(
                  "Or",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              SocialLoginButton(
                onPressed: () {},
                prefixIcon: Image.asset(
                  "assets/pngs/google.png",
                  height: 24,
                  width: 24,
                ),
                title: Text(
                  "Sign In with Google",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: AppColors.greyDark,
                      ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SocialLoginButton(
                prefixIcon: Image.asset(
                  "assets/pngs/facebook.png",
                  height: 24,
                  width: 24,
                ),
                title: Text(
                  "Sign In with Facebook",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: AppColors.greyDark,
                      ),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              BottomText(
                title: "Don't have an account?",
                action: "Sign Up",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
