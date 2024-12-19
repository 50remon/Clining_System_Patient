import 'dart:async';

import 'package:clinic_system_patient/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class OtpCode extends StatefulWidget {
  const OtpCode({super.key});

  @override
  State<OtpCode> createState() => _OtpCodeState();
}

class _OtpCodeState extends State<OtpCode> with TickerProviderStateMixin {
  final _textEditingController = TextEditingController();
  late Timer _timer;
  int _start = 59;
  int _end = 02;

  bool isLoading = false;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            _end--;
            _start = 59;
          });
        }
        if (_end == -1) {
          setState(() {
            timer.cancel();
            isLoading = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    isLoading = true;
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Sizes.s30.h,
                ),
                Text(
                  "رمز التحقق",
                  style: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s24,
                  ),
                ),
                SizedBox(
                  height: Sizes.s60.h,
                ),
                Text(
                  "تم ارسال رمز التحقق الخاص بك",
                  style: getMediumStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s18,
                  ),
                ),
                SizedBox(
                  height: Sizes.s20.h,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: PinCodeTextField(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    appContext: context,
                    textStyle: getBoldStyle(
                      color: ColorManager.white,
                      fontSize: 24,
                    ),
                    pastedTextStyle: getBoldStyle(
                      color: ColorManager.white,
                      fontSize: 24,
                    ),
                    length: 5,
                    animationType: AnimationType.slide,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(15.r),
                      fieldHeight: 65,
                      fieldWidth: 60,
                      disabledColor: ColorManager.white,
                      activeColor: ColorManager.transparent,
                      activeFillColor: ColorManager.primary,
                      inactiveColor: ColorManager.white,
                      inactiveFillColor: ColorManager.white,
                      selectedFillColor: ColorManager.white,
                      activeBoxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          color: ColorManager.black.withOpacity(.25),
                          blurRadius: 10,
                          spreadRadius: 1,
                        )
                      ],
                      inActiveBoxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          color: ColorManager.black.withOpacity(.25),
                          blurRadius: 10,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    cursorColor: ColorManager.primary,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: _textEditingController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: Sizes.s20.h,
                ),
                _end != -1
                    ? Row(
                        children: [
                          Text(
                            "اعادة ارسال الرمز بعد",
                            style: getRegularStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s15),
                          ),
                          SizedBox(
                            width: Sizes.s20.w,
                          ),
                          Text(
                            _start < 10
                                ? "0${_start.toString()}: 0${_end.toString()}"
                                : "${_start.toString()}: 0${_end.toString()}",
                            style: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s15),
                          ),
                        ],
                      )
                    : Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _textEditingController.clear();
                              _start = 59;
                              _end = 02;
                              isLoading = true;
                              startTimer();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Insets.s15),
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(25.r),
                              border: Border.all(
                                width: 1,
                                color: ColorManager.primary,
                              ),
                            ),
                            child: Text(
                              "اعادة ارسال رمز التحقق",
                              style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s15,
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: Sizes.s83.h,
                ),
                CustomElevatedButton(
                  label: 'تأكيد',
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    Routes.authenticationSuccess,
                  ),
                  maximumSize: const Size(260, 55),
                ),
                SizedBox(
                  height: Sizes.s40.h,
                ),
                Image.asset(
                  ImageAssets.enterOtp,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
