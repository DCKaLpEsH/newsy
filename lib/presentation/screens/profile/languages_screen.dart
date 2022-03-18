import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_colors.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Language",
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
              height: 8.h,
            ),
            LanguageSelectionWidget(
              language: "English",
              isSelected: true,
              onTap: () {},
            ),
            LanguageSelectionWidget(
              language: "Turkish",
              isSelected: false,
              onTap: () {},
            ),
            LanguageSelectionWidget(
              language: "German",
              isSelected: false,
              onTap: () {},
            ),
            LanguageSelectionWidget(
              language: "Spanish",
              isSelected: false,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSelectionWidget extends StatelessWidget {
  const LanguageSelectionWidget({
    Key? key,
    required this.language,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String language;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.purplePrimary : AppColors.greyLighter,
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
            language,
            style: GoogleFonts.sourceSansPro(
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
              color: isSelected ? Colors.white : AppColors.greyPrimary,
            ),
          ),
          if (isSelected) ...[
            const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ]
        ],
      ),
    );
  }
}
