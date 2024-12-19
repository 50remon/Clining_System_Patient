import 'package:clinic_system_patient/core/resources/color_manager.dart';
import 'package:clinic_system_patient/core/resources/font_manager.dart';
import 'package:clinic_system_patient/core/resources/styles_manager.dart';
import 'package:clinic_system_patient/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultDropBtn extends StatelessWidget {
  const DefaultDropBtn({
    super.key,
    required this.currentValue,
    this.firstValue,
    this.secondValue,
    this.firstTitle,
    this.secondTitle,
    this.onChanged,
    this.labelTextStyle,
    this.label,
    this.items,
    this.borderRadius,
    this.alignment,
    this.isExpanded = true,
    this.isDense = true,
    this.decoration,
    this.icon,
  });

  final String currentValue;
  final String? firstValue;
  final String? secondValue;
  final String? firstTitle;
  final String? secondTitle;
  final void Function(String?)? onChanged;
  final TextStyle? labelTextStyle;
  final String? label;
  final List<DropdownMenuItem<String>>? items;
  final BorderRadiusGeometry? borderRadius;
  final AlignmentGeometry? alignment;
  final Decoration? decoration;
  final bool isExpanded;
  final bool isDense;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label!,
                style: labelTextStyle ??
                    getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s18,
                    ),
              )
            : const SizedBox(),
        Container(
          alignment: alignment ?? Alignment.center,
          decoration: decoration == null
              ? decoration
              : BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(25.r),
                  color: ColorManager.white,
                  border: Border.all(
                    width: .2,
                    color: ColorManager.black.withOpacity(.5),
                  ),
                ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              padding: const EdgeInsets.symmetric(
                vertical: Insets.s8,
                horizontal: Insets.s8,
              ),
              dropdownColor: ColorManager.white,
              isDense: isDense,
              iconSize: 30,
              isExpanded: isExpanded,
              icon: icon ??
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    color: ColorManager.primary, // Add this
                  ),
              value: currentValue,
              items: items ??
                  [
                    DropdownMenuItem(
                      value: firstValue,
                      child: Text(firstTitle ?? "",
                          style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s20)),
                    ),
                    DropdownMenuItem(
                      value: secondValue,
                      child: Text(secondTitle ?? "",
                          style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s20)),
                    )
                  ],
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
