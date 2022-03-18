import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsy/presentation/theme/app_colors.dart';

class NewsCard2 extends StatelessWidget {
  const NewsCard2({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);
  final String title;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 12.h,
      ),
      height: 272.h,
      width: 336.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.greyLighter,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
            child: imageUrl == null
                ? SizedBox(
                    height: 192.h,
                    child: Placeholder(
                      fallbackWidth: 272.h,
                      fallbackHeight: 192.w,
                    ),
                  )
                : Image.network(
                    imageUrl!,
                    height: 192.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 46.w,
            ),
            child: Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/svgs/bookmark.svg",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
