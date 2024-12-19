import 'package:clinic_system_patient/features/profile/view/widgets/profile_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routes/routes.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.topEnd,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: Sizes.s30.h,
                  ),
                  Center(
                    child: Text(
                      "الملف الشخصى",
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizes.s30.h,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: Insets.s24),
                    child: CircleAvatar(
                      radius: 100.r,
                      backgroundColor: ColorManager.white,
                      backgroundImage: const AssetImage(
                        ImageAssets.avatarImg,
                      ),
                    ),
                  ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Padding(
                  //       padding:
                  //           const EdgeInsetsDirectional.only(end: Insets.s24),
                  //       child: CircleAvatar(
                  //         radius: 100.r,
                  //         backgroundColor: ColorManager.white,
                  //         backgroundImage: const AssetImage(
                  //           ImageAssets.avatarImg,
                  //         ),
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: () =>
                  //           Navigator.of(context).pushNamed(Routes.settings),
                  //       child: const ImageIcon(
                  //         size: 40,
                  //         AssetImage(
                  //           ImageAssets.settingsIcon,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Text(
                    "Remon Fayez",
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s24,
                    ),
                  ),
                  SizedBox(
                    height: Sizes.s30.h,
                  ),
                  const ProfileItems(
                    title: 'الايميل    : ',
                    data: 'rymwnfayz707@gmail.com',
                  ),
                  SizedBox(
                    height: Sizes.s10.h,
                  ),
                  const ProfileItems(
                    title: 'الموبايل  : ',
                    data: '01226026985',
                  ),
                  SizedBox(
                    height: Sizes.s10.h,
                  ),
                  const ProfileItems(
                    title: 'السن        :   ',
                    data: ' 23 سنه',
                  ),
                  SizedBox(
                    height: Sizes.s10.h,
                  ),
                  const ProfileItems(
                    title: 'الجنس     :   ',
                    data: ' ذكر',
                  ),
                  SizedBox(
                    height: Sizes.s10.h,
                  ),
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Column(
                        children: [
                          const ProfileItems(
                            title: 'الطول      :   ',
                            data: ' 185سم',
                          ),
                          SizedBox(
                            height: Sizes.s10.h,
                          ),
                          const ProfileItems(
                            title: 'الوزن        :   ',
                            data: ' 74 كجم',
                          ),
                        ],
                      ),
                      Center(
                        child: Image.asset(ImageAssets.creativeWritingProfile),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: Sizes.s100.h,
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed(Routes.settings),
                  child: const ImageIcon(
                    size: 40,
                    AssetImage(
                      ImageAssets.settingsIcon,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
