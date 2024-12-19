import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({super.key, required this.title, required this.data});

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: getRegularStyle(
            color: ColorManager.black,
            fontSize: FontSize.s20,
          ),
        ),
        Text(
          data,
          style: getRegularStyle(
            color: ColorManager.black,
            fontSize: FontSize.s20,
          ),
        ),
      ],
    );
  }
}
