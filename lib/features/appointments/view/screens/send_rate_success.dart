import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routes/routes.dart';

class SendRateSuccess extends StatefulWidget {
  const SendRateSuccess({super.key});

  @override
  State<SendRateSuccess> createState() => _SendRateSuccessState();
}

class _SendRateSuccessState extends State<SendRateSuccess> {
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
            Image.asset(ImageAssets.rateSuccess),
            SizedBox(
              height: Sizes.s15.h,
            ),
            Center(
              child: Text(
                "تم ارسال تقييمك بنجاح",
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
