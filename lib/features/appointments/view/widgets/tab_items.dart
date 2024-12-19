import 'package:clinic_system_patient/core/resources/color_manager.dart';
import 'package:clinic_system_patient/core/resources/font_manager.dart';
import 'package:clinic_system_patient/core/resources/styles_manager.dart';
import 'package:clinic_system_patient/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabItems extends StatelessWidget {
  const TabItems({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
          horizontal: Insets.s20, vertical: Insets.s8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: isSelected
              ? ColorManager.white
              : ColorManager.black.withOpacity(.5),
          width: isSelected ? 1 : 0.2,
        ),
        color: isSelected ? ColorManager.primary : ColorManager.white,
      ),
      child: Text(
        title,
        style: getRegularStyle(
          fontSize: FontSize.s15,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
