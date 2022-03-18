import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsy/bloc/top_headlines/top_headlines_bloc.dart';
import 'package:newsy/presentation/screens/home/bookmarks_page.dart';
import 'package:newsy/presentation/screens/home/categories_page.dart';
import 'package:newsy/presentation/screens/home/home_page.dart';
import 'package:newsy/presentation/screens/home/user_profile_page.dart';
import 'package:newsy/presentation/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/articles_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _controller;
  int currIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ArticlesRepository(),
      child: BlocProvider(
        create: (context) => TopHeadlinesBloc(
            articlesRepository: context.read<ArticlesRepository>())
          ..add(
            const TopHeadlinesFetchingEvent(
              category: "",
            ),
          ),
        child: Scaffold(
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
                  // blurRadius: 2.0,
                  spreadRadius: 0.8,
                ),
              ],
            ),
            child: _btmNavIcons(),
          ),
          body: PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              HomePage(
                controller: _controller,
              ),
              CategoriesPage(),
              const BookmarksPage(),
              const UserProfilePage(),
            ],
          ),
        ),
      ),
    );
  }

  Row _btmNavIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          child: SvgPicture.asset(
            "assets/svgs/home.svg",
            color:
                currIndex == 0 ? AppColors.purplePrimary : AppColors.greyLight,
          ),
          onTap: () {
            _controller.animateToPage(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
            currIndex = 0;
            setState(() {});
          },
        ),
        InkWell(
          onTap: () {
            _controller.animateToPage(
              1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
            currIndex = 1;
            setState(() {});
          },
          child: SvgPicture.asset(
            "assets/svgs/categories.svg",
            color:
                currIndex == 1 ? AppColors.purplePrimary : AppColors.greyLight,
          ),
        ),
        InkWell(
          onTap: () {
            _controller.animateToPage(
              2,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
            currIndex = 2;
            setState(() {});
          },
          child: SvgPicture.asset(
            "assets/svgs/bookmark.svg",
            color:
                currIndex == 2 ? AppColors.purplePrimary : AppColors.greyLight,
          ),
        ),
        InkWell(
          onTap: () {
            _controller.animateToPage(
              3,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
            currIndex = 3;
            setState(() {});
          },
          child: SvgPicture.asset(
            "assets/svgs/user.svg",
            color:
                currIndex == 3 ? AppColors.purplePrimary : AppColors.greyLight,
          ),
        ),
      ],
    );
  }
}
