import 'package:clinic_system_patient/core/resources/assets_manager.dart';
import 'package:clinic_system_patient/core/resources/color_manager.dart';
import 'package:clinic_system_patient/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/values_manager.dart';
import '../widgets/setting_items.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const ImageIcon(
            size: 24,
            AssetImage(ImageAssets.arrowBack),
          ),
        ),
        title: const Text(
          "الاعدادات",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
        child: Column(
          children: [
            SizedBox(
              height: Sizes.s60.h,
            ),
            InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.personalDataChange),
              child: const SettingItems(
                title: 'تعديل البيانات الشخصية',
                icon: Icons.arrow_forward_ios_outlined,
              ),
            ),
            const Divider(),
            SizedBox(
              height: Sizes.s15.h,
            ),
            const SettingItems(
              title: 'تغيير اللغة',
              icon: Icons.language,
            ),
            const Divider(),
            SizedBox(
              height: Sizes.s15.h,
            ),
            const SettingItems(
              title: 'عن البرنامج',
              icon: Icons.info_outline,
            ),
            const Divider(),
            SizedBox(
              height: Sizes.s15.h,
            ),
            InkWell(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(Routes.login),
              child: SettingItems(
                title: 'تسجيل الخروج',
                icon: Icons.logout_outlined,
                titleColor: ColorManager.error,
                iconColor: ColorManager.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
