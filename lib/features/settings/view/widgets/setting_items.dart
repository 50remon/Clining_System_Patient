import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SettingItems extends StatelessWidget {
  const SettingItems(
      {super.key,
      required this.title,
      required this.icon,
      this.titleColor,
      this.iconColor});

  final String title;
  final Color? titleColor;
  final Color? iconColor;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: getRegularStyle(
            color: titleColor ?? ColorManager.black,
            fontSize: FontSize.s20,
          ),
        ),
        Icon(
          icon,
          color: iconColor ?? ColorManager.black,
          size: 20,
        )
      ],
    );
  }
}
