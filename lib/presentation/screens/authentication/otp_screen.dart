import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/presentation/screens/authentication/create_new_password_screen.dart';
import 'package:newsy/presentation/screens/authentication/widgets/authentication_text_form_field.dart';
import 'package:newsy/presentation/screens/authentication/widgets/bottom_text_widget.dart';

import '../../theme/app_colors.dart';
import '../../widgets/action_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late TextEditingController firstController,
      secondController,
      thirdController,
      fourthController;

  late FocusNode secondFn, firstFn, thirdFn, fourthFn;

  @override
  void initState() {
    super.initState();
    firstController = TextEditingController();
    secondController = TextEditingController();
    thirdController = TextEditingController();
    fourthController = TextEditingController();
    firstFn = FocusNode();
    secondFn = FocusNode();
    thirdFn = FocusNode();
    fourthFn = FocusNode();
  }

  @override
  void dispose() {
    firstFn.dispose();
    thirdFn.dispose();
    secondFn.dispose();
    fourthFn.dispose();
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
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
                "Verification Code ✅",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "You need to enter 4-digit code we send to your email adress.",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OTPTextField(
                    controller: firstController,
                    focusNode: firstFn,
                    onChanged: (s) {
                      if (s!.isNotEmpty) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  OTPTextField(
                    controller: secondController,
                    focusNode: secondFn,
                    onChanged: (s) {
                      if (s!.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                  OTPTextField(
                    controller: thirdController,
                    focusNode: thirdFn,
                    onChanged: (s) {
                      if (s!.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                  OTPTextField(
                    controller: fourthController,
                    focusNode: fourthFn,
                    onChanged: (s) {
                      if (s!.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                ],
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
                      builder: (context) => const NewPasswodScreen(),
                    ),
                  );
                },
              ),
              const Spacer(),
              BottomText(
                title: "Didn’t receive an email?",
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

class OTPTextField extends StatelessWidget {
  const OTPTextField(
      {Key? key,
      required this.focusNode,
      required this.controller,
      required this.onChanged})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      onChanged: onChanged,
      maxLength: 1,
      buildCounter: (
        context, {
        maxLength = 0,
        currentLength = 0,
        isFocused = false,
      }) {
        return const SizedBox.shrink();
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        constraints: const BoxConstraints.tightFor(
          width: 72,
          height: 72,
        ),
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
      ),
    );
  }
}
