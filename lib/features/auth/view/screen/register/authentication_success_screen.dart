import 'package:clinic_system_patient/core/resources/assets_manager.dart';
import 'package:clinic_system_patient/core/resources/styles_manager.dart';
import 'package:clinic_system_patient/core/resources/values_manager.dart';
import 'package:clinic_system_patient/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';

class AuthenticationSuccessScreen extends StatefulWidget {
  const AuthenticationSuccessScreen({super.key});

  @override
  State<AuthenticationSuccessScreen> createState() =>
      _AuthenticationSuccessScreenState();
}

class _AuthenticationSuccessScreenState
    extends State<AuthenticationSuccessScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, Routes.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAssets.authenticationSuccess),
            SizedBox(
              height: Sizes.s15.h,
            ),
            SizedBox(
              width: 248,
              child: Center(
                child: Text(
                  "تم اتمام  عملية التحقق بنجاح",
                  style: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
