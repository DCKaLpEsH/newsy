import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:newsy/presentation/screens/home/widgets/news_card_2.dart';

import '../../theme/app_colors.dart';
import 'widgets/bookmark_tile_widget.dart';
import 'widgets/category_widget.dart';
import 'widgets/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
  late FocusNode searchFn;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchFn = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
                    "Browse",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "Discover things of this world",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  TextFormField(
                    controller: searchController,
                    focusNode: searchFn,
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
                      prefixIconConstraints: BoxConstraints.tightFor(
                        height: 22.h,
                        width: 32.w,
                      ),
                      suffixIconConstraints: BoxConstraints.tightFor(
                        height: 22.h,
                        width: 32.w,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: SvgPicture.asset(
                          "assets/svgs/search.svg",
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: SvgPicture.asset(
                            "assets/svgs/mic.svg",
                            width: 16.w,
                            height: 22.h,
                          ),
                        ),
                        onTap: () {},
                      ),
                      hintText: "Search",
                      hintStyle: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                left: 20.w,
              ),
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  CategoryWidget(
                    onTap: () {},
                    text: "Random",
                  ),
                  CategoryWidget(
                    onTap: () {},
                    text: "Sports",
                  ),
                  CategoryWidget(
                    onTap: () {},
                    text: "Gaming",
                  ),
                  CategoryWidget(
                    onTap: () {},
                    text: "Politics",
                  ),
                  CategoryWidget(
                    onTap: () {},
                    text: "View All",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  NewsCard2(
                    title: "A Simple Trick For Creating Color Palettes Quickly",
                  ),
                  NewsCard2(
                    title: "A Simple Trick For Creating Color Palettes Quickly",
                  ),
                  NewsCard2(
                    title: "A Simple Trick For Creating Color Palettes Quickly",
                  ),
                  NewsCard2(
                    title: "A Simple Trick For Creating Color Palettes Quickly",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Recommended for you",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const Spacer(),
                      Text(
                        "See All",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const BookmarkTileWidget(
                          imageUrl: "assets/pngs/dummy.png",
                          category: "UI/UX Design",
                          title:
                              "A Simple Trick For Creating Color Palettes Quickly",
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
