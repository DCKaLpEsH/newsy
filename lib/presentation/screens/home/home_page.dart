import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:newsy/presentation/screens/article_description/article_description_screen.dart';
import 'package:newsy/presentation/screens/home/widgets/news_card_2.dart';

import '../../../bloc/top_headlines/top_headlines_bloc.dart';
import '../../theme/app_colors.dart';
import 'widgets/bookmark_tile_widget.dart';
import 'widgets/category_widget.dart';
import 'widgets/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.controller}) : super(key: key);
  final PageController controller;

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
                    onTap: () {
                      BlocProvider.of<TopHeadlinesBloc>(context).add(
                        const TopHeadlinesFetchingEvent(
                          category: "",
                        ),
                      );
                    },
                    text: "Current Headlines",
                  ),
                  CategoryWidget(
                    onTap: () {
                      BlocProvider.of<TopHeadlinesBloc>(context).add(
                        const TopHeadlinesFetchingEvent(
                          category: "general",
                        ),
                      );
                    },
                    text: "General",
                  ),
                  CategoryWidget(
                    onTap: () {
                      BlocProvider.of<TopHeadlinesBloc>(context).add(
                        const TopHeadlinesFetchingEvent(
                          category: "business",
                        ),
                      );
                    },
                    text: "Business",
                  ),
                  CategoryWidget(
                    onTap: () {
                      BlocProvider.of<TopHeadlinesBloc>(context).add(
                        const TopHeadlinesFetchingEvent(
                          category: "enterntainment",
                        ),
                      );
                    },
                    text: "Entertainment",
                  ),
                  CategoryWidget(
                    onTap: () {
                      widget.controller.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    text: "View All",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            BlocBuilder<TopHeadlinesBloc, TopHeadlinesState>(
              bloc: context.read<TopHeadlinesBloc>(),
              builder: (context, state) {
                if (state is TopHeadlinesFetchedState) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.articles.length,
                    itemBuilder: (context, index) {
                      final article = state.articles[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ArticleDescriptionScreen(article: article),
                            ),
                          );
                        },
                        child: NewsCard2(
                          title: article.title!,
                          imageUrl: article.urlToImage,
                        ),
                      );
                    },
                  );
                } else if (state is TopHeadlinesEmptyState) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFEEF0FB),
                            shape: BoxShape.circle,
                          ),
                          margin: EdgeInsets.only(
                            top: 50.h,
                          ),
                          padding: const EdgeInsets.all(24),
                          child: SvgPicture.asset(
                            "assets/svgs/empty_bookmark.svg",
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          "No Articles found.",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: 16.sp,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
                // return ListView(
                //   children: const [
                //     NewsCard2(
                //       title:
                //           "A Simple Trick For Creating Color Palettes Quickly",
                //     ),
                //     NewsCard2(
                //       title:
                //           "A Simple Trick For Creating Color Palettes Quickly",
                //     ),
                //     NewsCard2(
                //       title:
                //           "A Simple Trick For Creating Color Palettes Quickly",
                //     ),
                //     NewsCard2(
                //       title:
                //           "A Simple Trick For Creating Color Palettes Quickly",
                //     ),
                //   ],
                // );
              },
            ),
            // SizedBox(
            //   height: 48.h,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 20.w,
            //   ),
            //   child: Column(
            //     children: [
            //       Row(
            //         children: [
            //           Text(
            //             "Recommended for you",
            //             style: Theme.of(context).textTheme.headline6,
            //           ),
            //           const Spacer(),
            //           Text(
            //             "See All",
            //             style: Theme.of(context).textTheme.subtitle1!.copyWith(
            //                   fontSize: 14.sp,
            //                 ),
            //           ),
            //         ],
            //       ),
            //       ListView.builder(
            //           shrinkWrap: true,
            //           itemCount: 2,
            //           physics: const NeverScrollableScrollPhysics(),
            //           itemBuilder: (context, index) {
            //             return const BookmarkTileWidget(
            //               imageUrl: "assets/pngs/dummy.png",
            //               category: "UI/UX Design",
            //               title:
            //                   "A Simple Trick For Creating Color Palettes Quickly",
            //             );
            //           })
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
