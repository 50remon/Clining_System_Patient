import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.label,
    this.hint,
    this.isObscured = false,
    this.iconData,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.backgroundColor,
    this.hintTextStyle,
    this.labelTextStyle,
    this.cursorColor,
    this.readOnly = false,
    this.validation,
    this.onTap,
    this.maxLines,
    this.prefixIcon,
    this.borderBackgroundColor,
    this.suffixIcon,
    this.contentPadding,
    this.widthBorderSide = 0.2,
    this.borderRadius,
    this.decoration,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final bool isObscured;
  final String? label;
  final String? hint;
  final TextInputType textInputType;
  final IconData? iconData;
  final Color? backgroundColor;
  final Color? borderBackgroundColor;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? textStyle;
  final Color? cursorColor;
  final bool readOnly;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validation;
  final void Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final double widthBorderSide;
  final double? borderRadius;
  final Decoration? decoration;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool hidden = widget.isObscured;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Text(
                widget.label!,
                style: widget.labelTextStyle ??
                    getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s18,
                    ),
              )
            : const SizedBox(),
        Container(
          decoration: widget.decoration,
          child: TextFormField(
            maxLines: widget.maxLines ?? 1,
            controller: widget.controller,
            focusNode: widget.focusNode,
            readOnly: widget.readOnly,
            style: widget.textStyle ??
                getMediumStyle(
                  color: ColorManager.black.withOpacity(.50),
                  fontSize: FontSize.s17,
                ),
            obscureText: hidden,
            keyboardType: widget.textInputType,
            obscuringCharacter: '*',
            cursorColor: widget.cursorColor ?? ColorManager.black,
            onTap: widget.onTap,
            onEditingComplete: () {
              widget.focusNode?.unfocus();
              if (widget.nextFocus != null) {
                FocusScope.of(context).requestFocus(widget.nextFocus);
              }
            },
            textInputAction: widget.nextFocus == null
                ? TextInputAction.done
                : TextInputAction.next,
            validator: (value) {
              if (widget.validation == null) {
                setState(() => errorText = null);
              } else {
                setState(() => errorText = widget.validation!(value));
              }
              return errorText;
            },
            decoration: InputDecoration(
              contentPadding:
                  widget.contentPadding ?? EdgeInsets.all(Insets.s15.sp),
              hintText: widget.hint,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isObscured
                  ? IconButton(
                      onPressed: () => setState(() => hidden = !hidden),
                      iconSize: Sizes.s24.sp,
                      splashRadius: Sizes.s1,
                      isSelected: !hidden,
                      color: widget.cursorColor,
                      selectedIcon: Icon(
                        Icons.remove_red_eye_rounded,
                        color: ColorManager.primary,
                      ),
                      icon: Icon(
                        Icons.visibility_off,
                        color: ColorManager.primary,
                      ),
                    )
                  : widget.suffixIcon,
              hintStyle: widget.hintTextStyle ??
                  getRegularStyle(
                    color: ColorManager.black.withOpacity(.50),
                    fontSize: FontSize.s18,
                  ),
              fillColor: widget.backgroundColor ?? ColorManager.springWood,
              filled: true,
              border: OutlineInputBorder(
                gapPadding: 4,
                borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 50.r),
                borderSide: BorderSide(
                  width: widget.widthBorderSide,
                  color: widget.borderBackgroundColor ??
                      ColorManager.black.withOpacity(.50),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: 4,
                borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 50.r),
                borderSide: BorderSide(
                  width: widget.widthBorderSide,
                  color: widget.borderBackgroundColor ??
                      ColorManager.black.withOpacity(.50),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 4,
                borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 50.r),
                borderSide: BorderSide(
                  width: widget.widthBorderSide,
                  color: widget.borderBackgroundColor ?? ColorManager.primary,
                ),
              ),
              errorStyle: TextStyle(
                fontSize: FontSize.s0,
                color: ColorManager.transparent,
              ),
            ),
          ),
        ),
        errorText == null
            ? const SizedBox()
            : Padding(
                padding: EdgeInsetsDirectional.only(
                  top: Insets.s8.h,
                  start: Insets.s8.w,
                ),
                child: Text(
                  errorText!,
                  style: getMediumStyle(
                    color: ColorManager.error,
                    fontSize: FontSize.s18,
                  ),
                ),
              ),
      ],
    );
  }
}
