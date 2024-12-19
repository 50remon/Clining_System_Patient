import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/font_manager.dart';
import '../../../../../../core/resources/styles_manager.dart';
import '../../../../../../core/resources/values_manager.dart';

class NextAppointment extends StatelessWidget {
  const NextAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: Insets.s24, right: Insets.s24, bottom: Insets.s10),
          child: Text(
            "الموعد القادم",
            style: getMediumStyle(
              color: ColorManager.black,
              fontSize: FontSize.s18,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
              left: Insets.s24, right: Insets.s24, bottom: Insets.s20),
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(25.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(end: Insets.s24),
                padding: const EdgeInsetsDirectional.only(
                  end: Insets.s8,
                  start: Insets.s8,
                  top: Insets.s8,
                  bottom: Insets.s8,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.r),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "دورك",
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s18,
                      ),
                    ),
                    Text(
                      "5",
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s24,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: Insets.s24,
                  top: Insets.s20,
                  bottom: Insets.s20,
                ),
                child: Column(
                  children: [
                    Text(
                      "كشف باطنه",
                      style: getBoldStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    SizedBox(
                      height: Sizes.s5.h,
                    ),
                    Text(
                      "د / محمد خالد",
                      style: getMediumStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    SizedBox(
                      height: Sizes.s5.h,
                    ),
                    Text(
                      "يوم الخميس 24/10/2024",
                      style: getMediumStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s11,
                      ),
                    ),
                    SizedBox(
                      height: Sizes.s5.h,
                    ),
                    Text(
                      "من 10:00 ص الى 10:30 ص",
                      style: getMediumStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s11,
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: Image(
                  image: const AssetImage(ImageAssets.docImg),
                  height: Sizes.s100.h,
                  width: Sizes.s100.w,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
