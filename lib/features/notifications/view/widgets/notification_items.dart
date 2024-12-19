import 'package:clinic_system_patient/features/notifications/data/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';

class NotificationItems extends StatelessWidget {
  const NotificationItems({
    super.key,
    required this.notificationModel,
  });

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Insets.s24, vertical: Insets.s24),
      decoration: BoxDecoration(
        color: notificationModel.type == Type.sure
            ? ColorManager.green.withOpacity(.40)
            : notificationModel.type == Type.cancel
                ? ColorManager.error.withOpacity(.40)
                : notificationModel.type == Type.info
                    ? ColorManager.orange.withOpacity(.40)
                    : ColorManager.primary.withOpacity(.40),
        borderRadius: BorderRadius.all(
          Radius.circular(25.r),
        ),
        border: Border.all(
          width: 1,
          color: ColorManager.white,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(-4, 4),
            spreadRadius: 0,
            color: notificationModel.type == Type.sure
                ? ColorManager.green.withOpacity(.25)
                : notificationModel.type == Type.cancel
                    ? ColorManager.error.withOpacity(.25)
                    : notificationModel.type == Type.info
                        ? ColorManager.orange.withOpacity(.25)
                        : ColorManager.primary.withOpacity(.25),
          )
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notificationModel.typeNotification,
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s15,
                ),
              ),
              SizedBox(
                height: Sizes.s5.h,
              ),
              SizedBox(
                width: Sizes.s200.w,
                child: Text(
                  notificationModel.message,
                  style: getRegularStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s15,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 20,
            backgroundColor: ColorManager.white,
            child: Image.asset(
              notificationModel.type == Type.sure
                  ? ImageAssets.iconCheck
                  : notificationModel.type == Type.cancel
                      ? ImageAssets.iconWarning
                      : notificationModel.type == Type.info
                          ? ImageAssets.iconInfo
                          : ImageAssets.iconAvgTime,
              height: Sizes.s60.h,
              width: Sizes.s60.w,
            ),
          )
        ],
      ),
    );
  }
}
