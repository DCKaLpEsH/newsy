import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class GridCategoryWidget extends StatelessWidget {
  const GridCategoryWidget({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.greyLighter,
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: AppColors.greyDark,
              ),
        ),
      ),
    );
  }
}
