import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routes/routes.dart';

class ReservationSuccess extends StatefulWidget {
  const ReservationSuccess({super.key});

  @override
  State<ReservationSuccess> createState() => _ReservationSuccessState();
}

class _ReservationSuccessState extends State<ReservationSuccess> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(context, Routes.home, (_) => false);
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
            Image.asset(ImageAssets.timeManagementImage),
            SizedBox(
              height: Sizes.s15.h,
            ),
            Center(
              child: Text(
                "تم حجز الموعد بنجاح",
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
