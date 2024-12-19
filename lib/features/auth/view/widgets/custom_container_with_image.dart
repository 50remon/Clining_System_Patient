import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class CustomContainerWithImage extends StatelessWidget {
  const CustomContainerWithImage({
    super.key,
    required this.imgName, this.onTap,
  });
  final Function()? onTap;
  final String imgName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: ColorManager.primary.withOpacity(.15),
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        child: Image.asset(
          imgName,
        ),
      ),
    );
  }
}
