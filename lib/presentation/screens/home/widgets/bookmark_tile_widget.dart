import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookmarkTileWidget extends StatelessWidget {
  const BookmarkTileWidget({
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            height: 96.h,
            width: 96.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 16.sp,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
