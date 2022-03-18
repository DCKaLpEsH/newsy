import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsy/data/models/articles_model.dart';
import 'package:newsy/presentation/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDescriptionScreen extends StatefulWidget {
  const ArticleDescriptionScreen({Key? key, required this.article})
      : super(key: key);
  final Articles article;
  @override
  State<ArticleDescriptionScreen> createState() =>
      _ArticleDescriptionScreenState();
}

class _ArticleDescriptionScreenState extends State<ArticleDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/svgs/bookmark.svg",
                  color: Colors.white,
                ),
                SizedBox(
                  width: 24.w,
                ),
                SvgPicture.asset(
                  "assets/svgs/share.svg",
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              child: Container(
                width: double.maxFinite,
                height: 10.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
              ),
              preferredSize: Size.fromHeight(30.h),
            ),
            toolbarHeight: 80.h,
            pinned: true,
            expandedHeight: 384.h,
            backgroundColor: AppColors.purplePrimary,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: widget.article.urlToImage == null
                  ? const Placeholder()
                  : Image.network(
                      widget.article.urlToImage!,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
              title: Text(
                widget.article.title!,
                style: Theme.of(context).textTheme.headline1,
              ),
              titlePadding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 30.h,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.article.content!.substring(
                        0,
                        200,
                      ),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    TextSpan(
                      text: "Read ahead.",
                      style: Theme.of(context).textTheme.bodyText1,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await launch(widget.article.url!);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
