import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsy/presentation/screens/home/home_page.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({Key? key}) : super(key: key);

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
            "Bookmarks",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "Saved articles in the library",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          // SizedBox(
          //   height: 32.h,
          // ),
          const Spacer(),
          const Center(
            child: EmptyBookmarksWidget(),
          ),
          const Spacer(),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 10,
          //     shrinkWrap: true,
          //     physics: const BouncingScrollPhysics(),
          //     itemBuilder: (context, index) => const BookmarkTileWidget(),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class EmptyBookmarksWidget extends StatelessWidget {
  const EmptyBookmarksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFEEF0FB),
            shape: BoxShape.circle,
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
          "You haven't saved any articles yet.\nStart reading and bookmarking\nthem now",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 16.sp,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
