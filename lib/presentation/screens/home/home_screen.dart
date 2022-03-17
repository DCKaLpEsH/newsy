import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsy/presentation/screens/home/bookmarks_page.dart';
import 'package:newsy/presentation/screens/home/categories_page.dart';
import 'package:newsy/presentation/screens/home/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 96.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFE4E6EC),
              offset: Offset(0, -1.5),
              blurRadius: 2.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              "assets/svgs/home.svg",
            ),
            SvgPicture.asset(
              "assets/svgs/categories.svg",
            ),
            SvgPicture.asset(
              "assets/svgs/bookmark.svg",
            ),
            SvgPicture.asset(
              "assets/svgs/user.svg",
            ),
          ],
        ),
      ),
      body: PageView(
        children: [
          HomePage(),
          CategoriesPage(),
          BookmarksPage(),
        ],
      ),
    );
  }
}
