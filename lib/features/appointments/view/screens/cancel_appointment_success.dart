import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routes/routes.dart';

class CancelAppointmentSuccess extends StatefulWidget {
  const CancelAppointmentSuccess({super.key});

  @override
  State<CancelAppointmentSuccess> createState() =>
      _CancelAppointmentSuccessState();
}

class _CancelAppointmentSuccessState extends State<CancelAppointmentSuccess> {
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
            Image.asset(ImageAssets.cancelAppointment),
            SizedBox(
              height: Sizes.s15.h,
            ),
            Center(
              child: Text(
                "تم الغاء الحجز",
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
