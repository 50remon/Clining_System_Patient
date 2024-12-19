import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) =>
    TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: 'Cairo',
    );

TextStyle getLightStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.light,
      color,
    );

TextStyle getRegularStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.regular,
      color,
    );

TextStyle getMediumStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.medium,
      color,
    );

TextStyle getSemiBoldStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.semiBold,
      color,
    );

TextStyle getBoldStyle({
  double? fontSize,
  required Color color,
}) =>
    _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.bold,
      color,
    );

TextStyle getTextWithLine() => TextStyle(
      color: ColorManager.black,
      fontSize: FontSize.s16,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.lineThrough,
      decorationColor: ColorManager.black,
      fontFamily: 'Cairo',
    );
