import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/presentation/screens/authentication/signup_screen.dart';
import 'package:newsy/presentation/screens/authentication/widgets/auth_tff.dart';
import 'package:newsy/presentation/screens/authentication/widgets/authentication_text_form_field.dart';
import 'package:newsy/presentation/screens/authentication/widgets/bottom_text_widget.dart';
import 'package:newsy/presentation/theme/app_colors.dart';
import 'package:newsy/presentation/widgets/action_button.dart';

class NewPasswodScreen extends StatefulWidget {
  const NewPasswodScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswodScreen> createState() => _NewPasswodScreenState();
}

class _NewPasswodScreenState extends State<NewPasswodScreen> {
  late TextEditingController newPassController, confirmPassController;
  late FocusNode newPassFn, confirmPassFn;
  Color newPassColor = AppColors.greyPrimary;
  Color confirmPassColor = AppColors.greyPrimary;
  bool passObscure = false;
  bool confirmPassObscure = false;
  @override
  void initState() {
    newPassFn = FocusNode();
    confirmPassFn = FocusNode();
    newPassController = TextEditingController();
    confirmPassController = TextEditingController();
    newPassFn.addListener(() {
      if (newPassFn.hasFocus) {
        newPassColor = AppColors.purplePrimary;
      } else {
        newPassColor = AppColors.greyPrimary;
      }

      setState(() {});
    });
    confirmPassFn.addListener(() {
      if (confirmPassFn.hasFocus) {
        confirmPassColor = AppColors.purplePrimary;
      } else {
        confirmPassColor = AppColors.greyPrimary;
      }

      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    newPassController.dispose();
    confirmPassController.dispose();
    newPassFn.dispose();
    confirmPassFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Text(
                "Create New Password 🔒",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "You can create a new password, please dont forget it too.",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
                height: 32.h,
              ),
              TextFormField(
                controller: newPassController,
                focusNode: newPassFn,
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
                    Icons.lock_outline,
                    color: newPassColor,
                  ),
                  hintText: "New Password",
                  hintStyle: Theme.of(context).textTheme.headline5,
                  suffixIcon: GestureDetector(
                    child: passObscure
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: newPassColor,
                          )
                        : Icon(
                            Icons.visibility_outlined,
                            color: newPassColor,
                          ),
                    onTap: () {
                      setState(() {
                        passObscure = !passObscure;
                      });
                    },
                  ),
                ),
                obscureText: passObscure,
                obscuringCharacter: "*",
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                controller: confirmPassController,
                focusNode: confirmPassFn,
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
                    Icons.lock_outline,
                    color: confirmPassColor,
                  ),
                  hintText: "Confirm New Password",
                  hintStyle: Theme.of(context).textTheme.headline5,
                  suffixIcon: GestureDetector(
                    child: confirmPassObscure
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: confirmPassColor,
                          )
                        : Icon(
                            Icons.visibility_outlined,
                            color: confirmPassColor,
                          ),
                    onTap: () {
                      setState(() {
                        confirmPassObscure = !confirmPassObscure;
                      });
                    },
                  ),
                ),
                obscureText: confirmPassObscure,
                obscuringCharacter: "*",
              ),
              SizedBox(
                height: 16.h,
              ),
              ActionButton(
                text: "Confirm",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 335.h,
              ),
              BottomText(
                title: "Didn't receive an email?",
                action: "Send again",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
