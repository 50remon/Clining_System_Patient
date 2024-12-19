import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';

class CustomListViewWithLabel extends StatelessWidget {
  const CustomListViewWithLabel({
    super.key,
    required this.label,
    required this.itemBuilder,
    required this.itemCount,
    required this.heightListView,
  });

  final String label;
  final double heightListView;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: Insets.s10.h,
            right: Insets.s24,
            left: Insets.s24,
          ),
          child: Text(
            label,
            style: getMediumStyle(
              color: ColorManager.black,
              fontSize: FontSize.s18,
            ),
          ),
        ),
        SizedBox(
          height: heightListView,
          child: ListView.separated(
            padding: EdgeInsets.only(
              bottom: Insets.s20.h,
              right: Insets.s24,
              left: Insets.s24,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: itemBuilder,
            separatorBuilder: (_, index) => SizedBox(
              width: Sizes.s15.w,
            ),
            itemCount: itemCount,
          ),
        ),
      ],
    );
  }
}
