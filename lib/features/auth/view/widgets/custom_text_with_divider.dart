import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';

class CustomTextWithDivider extends StatelessWidget {
  const CustomTextWithDivider({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: Sizes.s5.w,
            thickness: 1,
            color: ColorManager.black,
          ),
        ),
        Text(
          title,
          style: getRegularStyle(
            color: ColorManager.black,
            fontSize: FontSize.s16,
          ),
        ),
        Expanded(
          child: Divider(
            indent: Sizes.s5.w,
            thickness: 1,
            color: ColorManager.black,
          ),
        ),
      ],
    );
  }
}
