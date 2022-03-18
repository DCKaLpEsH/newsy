import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/presentation/theme/app_colors.dart';

import 'widgets/grid_category_widget.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
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
              "Categories",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Hundreds of articles in each category",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 32.h,
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 72.h,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GridCategoryWidget(
                  title: categories[index],
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<String> categories = [
    "Sports",
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Technology",
    // "Politics",
    // "Life",
    // "Gaming",
    // "Animals",
    // "Nature",
    // "Food",
    // "Art",
    // "History",
    // "Fashion",
    // "Covid-19",
    // "Middle East",
  ];
  // List emojis = [
  //   "🏈   ",
  //   "⚖️   ",
  //   "🎮   ",
  //   "🌞   ",
  //   "🐻   ",
  //   "🌴   ",
  //   "🍔   ",
  //   "🎨   ",
  //   "📜   ",
  //   "👗   ",
  //   "😷   ",
  //   "⚔️   ",
  // ];
}
