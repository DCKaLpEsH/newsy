import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsy/presentation/screens/profile/change_password_screen.dart';
import 'package:newsy/presentation/screens/profile/languages_screen.dart';
import 'package:newsy/presentation/screens/profile/t_and_c_screen.dart';
import 'package:newsy/presentation/theme/app_colors.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 72.h,
          ),
          Text(
            "Profile",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 32.h,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: const AssetImage(
                  "assets/pngs/carousel_1.png",
                ),
                radius: 36.r,
              ),
              SizedBox(
                width: 24.w,
              ),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      "Eren Turkmen",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      "ertuken@gmail.com",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          ProfileOptionsWidget(
            title: "Notifications",
            onTap: () {},
            suffixIcon: CupertinoSwitch(
              value: true,
              onChanged: (b) {},
              activeColor: AppColors.purplePrimary,
            ),
          ),
          ProfileOptionsWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LanguagesScreen(),
                ),
              );
            },
            title: "Language",
          ),
          ProfileOptionsWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordScreen(),
                ),
              );
            },
            title: "Change Password",
          ),
          ProfileOptionsWidget(
            onTap: () {},
            title: "Privacy",
          ),
          ProfileOptionsWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TandCScreen(),
                ),
              );
            },
            title: "Terms & Conditions",
          ),
          ProfileOptionsWidget(
            onTap: () {},
            title: "Sign Out",
            suffixIcon: SvgPicture.asset(
              "assets/svgs/sign_out.svg",
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileOptionsWidget extends StatelessWidget {
  const ProfileOptionsWidget({
    Key? key,
    required this.onTap,
    this.suffixIcon,
    required this.title,
  }) : super(key: key);
  final VoidCallback onTap;
  final Widget? suffixIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greyLighter,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 56.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        margin: EdgeInsets.only(
          top: 16.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            suffixIcon ??
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.greyDark,
                  size: 15.w,
                ),
          ],
        ),
      ),
    );
  }
}
