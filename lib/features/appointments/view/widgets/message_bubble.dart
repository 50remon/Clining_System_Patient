import 'package:clinic_system_patient/core/resources/assets_manager.dart';
import 'package:clinic_system_patient/core/resources/color_manager.dart';
import 'package:clinic_system_patient/core/resources/font_manager.dart';
import 'package:clinic_system_patient/core/resources/styles_manager.dart';
import 'package:clinic_system_patient/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.sender == 'انت'; // Change to your sender logic

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          !isMe
              ? Text(
                  "09:10 AM",
                  style: getRegularStyle(
                    color: ColorManager.black.withOpacity(.5),
                    fontSize: FontSize.s15,
                  ),
                )
              : const SizedBox(),
          !isMe
              ? SizedBox(
                  width: Sizes.s40.w,
                )
              : const SizedBox(),
          Container(
            width: 260.w,
            margin: const EdgeInsets.symmetric(
              vertical: Insets.s24,
            ),
            padding: const EdgeInsets.symmetric(
                vertical: Insets.s12, horizontal: Insets.s24),
            decoration: BoxDecoration(
              color: isMe
                  ? ColorManager.primary.withOpacity(.9)
                  : ColorManager.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.r),
                topLeft: Radius.circular(isMe ? 25.r : 0),
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(isMe ? 0 : 25.r),
              ),
              border: Border.all(
                color: isMe ? ColorManager.white : ColorManager.primary,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.sender,
                  style: getBoldStyle(
                    fontSize: FontSize.s15,
                    color: isMe ? ColorManager.white : ColorManager.black,
                  ),
                ),
                Text(
                  message.text,
                  style: getBoldStyle(
                    fontSize: FontSize.s15,
                    color: isMe ? ColorManager.white : ColorManager.black,
                  ),
                ),
              ],
            ),
          ),
          isMe
              ? SizedBox(
                  width: Sizes.s8.w,
                )
              : const SizedBox(),
          isMe
              ? Image.asset(
                  ImageAssets.checkAllChat,
                )
              : const SizedBox(),
          isMe
              ? SizedBox(
                  width: Sizes.s15.w,
                )
              : const SizedBox(),
          isMe
              ? Text(
                  "09:10 AM",
                  style: getRegularStyle(
                    color: ColorManager.black.withOpacity(.5),
                    fontSize: FontSize.s15,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}
