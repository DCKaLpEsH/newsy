import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/presentation/screens/authentication/widgets/auth_tff.dart';
import 'package:newsy/presentation/widgets/action_button.dart';

import '../../theme/app_colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController currentPassController,
      newPassController,
      confirmPassController;
  late FocusNode currentPassFn, newPassFn, confirmPassFn;

  @override
  void initState() {
    super.initState();
    currentPassController = TextEditingController();
    newPassController = TextEditingController();
    confirmPassController = TextEditingController();
    currentPassFn = FocusNode();
    newPassFn = FocusNode();
    confirmPassFn = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            TextFormField(
              controller: currentPassController,
              focusNode: currentPassFn,
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
                  Icons.lock_outline_rounded,
                  color: AppColors.greyPrimary,
                ),
                hintText: "Current Password",
                hintStyle: Theme.of(context).textTheme.headline5,
              ),
            ),
            SizedBox(
              height: 16.h,
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
                  Icons.lock_outline_rounded,
                  color: AppColors.greyPrimary,
                ),
                hintText: "New Password",
                hintStyle: Theme.of(context).textTheme.headline5,
              ),
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
                  Icons.lock_outline_rounded,
                  color: AppColors.greyPrimary,
                ),
                hintText: "Confirm New Password",
                hintStyle: Theme.of(context).textTheme.headline5,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            ActionButton(
              text: "Change Password",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
