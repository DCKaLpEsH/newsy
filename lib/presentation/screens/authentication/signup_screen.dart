import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/presentation/screens/authentication/login_screen.dart';
import 'package:newsy/presentation/screens/authentication/widgets/authentication_text_form_field.dart';
import 'package:newsy/presentation/screens/authentication/widgets/bottom_text_widget.dart';
import 'package:newsy/presentation/theme/app_colors.dart';
import 'package:newsy/presentation/widgets/action_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController usernameController,
      emailController,
      passwordController,
      repeatPassController;
  late FocusNode usernameFn, emailFn, passwordFn, repeatPassFn;

  Color emailIconColor = AppColors.greyPrimary;
  Color usernameIconColor = AppColors.greyPrimary;
  Color passwordIconColor = AppColors.greyPrimary;
  Color repeatPassIconColor = AppColors.greyPrimary;

  bool passObscure = false;
  bool confirmPassObscure = false;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repeatPassController = TextEditingController();
    usernameFn = FocusNode();
    emailFn = FocusNode();
    passwordFn = FocusNode();
    repeatPassFn = FocusNode();
    usernameFn.addListener(() {
      // changeColor(usernameFn, usernameIconColor);
      if (usernameFn.hasFocus) {
        usernameIconColor = AppColors.purplePrimary;
      } else {
        usernameIconColor = AppColors.greyPrimary;
      }
      setState(() {});
    });
    emailFn.addListener(() {
      // changeColor(emailFn, emailIconColor);
      print("EMAIL");
      if (emailFn.hasFocus) {
        emailIconColor = AppColors.purplePrimary;
      } else {
        emailIconColor = AppColors.greyPrimary;
      }
      setState(() {});
    });
    passwordFn.addListener(() {
      // changeColor(passwordFn, passwordIconColor);
      if (passwordFn.hasFocus) {
        passwordIconColor = AppColors.purplePrimary;
      } else {
        passwordIconColor = AppColors.greyPrimary;
      }
      setState(() {});
    });
    repeatPassFn.addListener(() {
      // changeColor(repeatPassFn, repeatPassIconColor);
      if (repeatPassFn.hasFocus) {
        repeatPassIconColor = AppColors.purplePrimary;
      } else {
        repeatPassIconColor = AppColors.greyPrimary;
      }
      setState(() {});
    });
  }

  void changeColor(FocusNode focusNode, Color color) {
    if (focusNode.hasFocus) {
      color = AppColors.purplePrimary;
    } else {
      color = AppColors.greyPrimary;
    }
    setState(() {});
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPassController.dispose();
    usernameFn.dispose();
    emailFn.dispose();
    passwordFn.dispose();
    repeatPassFn.dispose();
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
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to Newsy 👋",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Hello, I guess you are new around here. You can start using the application after sign up.",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
                height: 32.h,
              ),
              SizedBox(
                height: 56.h,
                width: 336.w,
                child: TextFormField(
                  focusNode: usernameFn,
                  controller: usernameController,
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
                    hintText: "Username",
                    hintStyle: Theme.of(context).textTheme.headline5,
                    prefixIcon: Icon(
                      Icons.person_outline_rounded,
                      color: usernameIconColor,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 56.h,
                width: 336.w,
                child: TextFormField(
                  style: TextStyle(
                    color: AppColors.blackPrimary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  cursorColor: AppColors.purplePrimary,
                  cursorWidth: 3.0,
                  controller: emailController,
                  focusNode: emailFn,
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
                    hintText: "Email Address",
                    hintStyle: Theme.of(context).textTheme.headline5,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: emailIconColor,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 56.h,
                width: 336.w,
                child: TextFormField(
                  style: TextStyle(
                    color: AppColors.blackPrimary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  cursorColor: AppColors.purplePrimary,
                  cursorWidth: 3.0,
                  controller: passwordController,
                  focusNode: passwordFn,
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
                    hintText: "Password",
                    hintStyle: Theme.of(context).textTheme.headline5,
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: passwordIconColor,
                    ),
                    contentPadding: EdgeInsets.zero,
                    suffixIcon: Icon(
                      passObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: passwordIconColor,
                    ),
                  ),
                  obscureText: passObscure,
                  obscuringCharacter: "*",
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 56.h,
                width: 336.w,
                child: TextFormField(
                  style: TextStyle(
                    color: AppColors.blackPrimary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  cursorColor: AppColors.purplePrimary,
                  cursorWidth: 3.0,
                  controller: repeatPassController,
                  focusNode: repeatPassFn,
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
                    hintText: "Confirm Password",
                    hintStyle: Theme.of(context).textTheme.headline5,
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: repeatPassIconColor,
                    ),
                    contentPadding: EdgeInsets.zero,
                    suffixIcon: Icon(
                      confirmPassObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: repeatPassIconColor,
                    ),
                  ),
                  obscureText: confirmPassObscure,
                  obscuringCharacter: "*",
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              ActionButton(
                text: "Sign Up",
                onTap: () {},
              ),
              SizedBox(
                height: 202.h,
              ),
              BottomText(
                title: "Already have an account?",
                action: "Sign In",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField({
    required FocusNode focusNode,
    required TextEditingController controller,
    required String hint,
    required Icon prefixIcon,
    Icon? suffixIcon,
    bool? obscureText,
    VoidCallback? obscureCallback,
  }) {
    return TextFormField(
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
        prefixIcon: prefixIcon,
        suffixIcon: GestureDetector(
          child: suffixIcon,
          onTap: obscureCallback,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.headline5,
      ),
      obscureText: obscureText ?? false,
      obscuringCharacter: "*",
    );
  }
}
