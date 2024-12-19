import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? backgroundColor;
  final double? radius;
  final void Function() onTap;
  final TextStyle? textStyle;
  final bool isStadiumBorder;
  final Size minimumSize;
  final Size maximumSize;

  const CustomElevatedButton({
    super.key,
    this.prefixIcon,
    this.textStyle,
    this.isStadiumBorder = false,
    this.backgroundColor,
    this.radius,
    this.suffixIcon,
    required this.label,
    required this.onTap,
    this.minimumSize = const Size(194, 55),
     this.maximumSize= const Size(200, 64),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        maximumSize: maximumSize,
        minimumSize: minimumSize,
        shape: isStadiumBorder
            ? const StadiumBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
        backgroundColor: backgroundColor ?? ColorManager.primary,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
/*          prefixIcon ?? const SizedBox(),
          prefixIcon != null
              ? SizedBox(
                  width: 24.w,
                )
              : const SizedBox(),*/
          Text(
            label,
            style: textStyle ??
                getBoldStyle(color: ColorManager.white)
                    .copyWith(fontSize: FontSize.s24),
          ),
          // suffixIcon != null
          //     ? SizedBox(
          //         width: 27.w,
          //       )
          //     : const SizedBox(),
          // suffixIcon ?? const SizedBox(),
        ],
      ),
    );
  }
}
