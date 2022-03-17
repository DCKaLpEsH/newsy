import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.imageUrl,
    required this.category,
    required this.title,
  }) : super(key: key);
  final String imageUrl;
  final String category;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256.h,
      width: 256.w,
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.cover,
        ),
        gradient: const LinearGradient(
          begin: Alignment(6.123234262925839e-17, 1),
          end: Alignment(-1, 6.123234262925839e-17),
          colors: [
            Color.fromRGBO(34, 36, 47, 0),
            Color.fromRGBO(34, 36, 47, 0.47999998927116394)
          ],
        ),
      ),
      padding: EdgeInsets.only(
        right: 29.w,
        bottom: 24.h,
        left: 19.w,
        top: 26.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              "assets/svgs/bookmark.svg",
              color: Colors.white,
              height: 25.h,
              width: 16.w,
            ),
          ),
          const Spacer(),
          Text(
            category,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline1,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }
}
