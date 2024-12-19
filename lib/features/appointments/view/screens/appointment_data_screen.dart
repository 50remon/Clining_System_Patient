import 'package:clinic_system_patient/core/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class AppointmentDataScreen extends StatefulWidget {
  const AppointmentDataScreen({super.key});

  @override
  State<AppointmentDataScreen> createState() => _AppointmentDataScreenState();
}

class _AppointmentDataScreenState extends State<AppointmentDataScreen> {
  final _opinionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
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
          "بيانات الحجز",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
          child: Column(
            children: [
              SizedBox(
                height: Sizes.s20.h,
              ),
              Center(
                child: Container(
                  height: 250.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      width: 1,
                      color: args[1] == 0
                          ? ColorManager.primary
                          : ColorManager.green,
                    ),
                  ),
                  child: args[0].imageDoc == null
                      ? const SizedBox()
                      : Image.asset(
                          args[0].imageDoc!,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              SizedBox(
                height: Sizes.s20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        args[1] == 0 ? " حجز قادم " : " حجز مكتمل ",
                        style: getBoldStyle(
                          color: args[1] == 0
                              ? ColorManager.primary
                              : ColorManager.green,
                          fontSize: FontSize.s20,
                        ),
                      ),
                      SizedBox(
                        height: Sizes.s20.h,
                      ),
                      Text(
                        args[0].docName,
                        style: getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s20,
                        ),
                      ),
                      SizedBox(
                        height: Sizes.s20.h,
                      ),
                      Text(
                        args[0].data,
                        style: getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s20,
                        ),
                      ),
                      SizedBox(
                        height: Sizes.s20.h,
                      ),
                      Text(
                        args[0].time,
                        style: getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Insets.s15, vertical: Insets.s16),
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "دورك",
                          style: getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s18,
                          ),
                        ),
                        Text(
                          args[0].numberTurn.toString(),
                          style: getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Sizes.s83.h,
              ),
              args[1] == 1
                  ? Center(
                      child: CustomElevatedButton(
                        label: 'تشخيص الطبيب',
                        backgroundColor: ColorManager.white,
                        textStyle: getRegularStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s24,
                        ),
                        onTap: () => Navigator.of(context)
                            .pushNamed(Routes.prescription, arguments: args[0]),
                        maximumSize: const Size(260, 55),
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                height: Sizes.s24.h,
              ),
              args[1] == 0
                  ? Center(
                      child: CustomElevatedButton(
                        label: 'اعادة الجدولة',
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.reservation),
                        maximumSize: const Size(260, 55),
                      ),
                    )
                  : Center(
                      child: CustomElevatedButton(
                        label: 'اعادة الحجز',
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.reservation),
                        maximumSize: const Size(260, 55),
                      ),
                    ),
              SizedBox(
                height: Sizes.s24.h,
              ),
              args[1] == 0
                  ? Center(
                      child: CustomElevatedButton(
                        label: 'الغاء الحجز',
                        backgroundColor: ColorManager.white,
                        textStyle: getRegularStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s24,
                        ),
                        onTap: () => showThemeBottomSheet(
                          context,
                          SizedBox(
                            width: double.infinity,
                            height: 450.h,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "هل تريد الغاء الحجز ؟!",
                                  style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s32,
                                  ),
                                ),
                                SizedBox(
                                  height: Sizes.s40.h,
                                ),
                                Center(
                                  child: CustomElevatedButton(
                                    label: 'لا',
                                    onTap: () => Navigator.pop(context),
                                    maximumSize: const Size(260, 55),
                                  ),
                                ),
                                SizedBox(
                                  height: Sizes.s24.h,
                                ),
                                Center(
                                  child: CustomElevatedButton(
                                    label: 'الغاء الحجز',
                                    backgroundColor: ColorManager.white,
                                    textStyle: getRegularStyle(
                                      color: ColorManager.black,
                                      fontSize: FontSize.s24,
                                    ),
                                    onTap: () => Navigator.pushNamed(context,
                                        Routes.cancelAppointmentSuccess),
                                    maximumSize: const Size(260, 55),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        maximumSize: const Size(260, 55),
                      ),
                    )
                  : Center(
                      child: CustomElevatedButton(
                        label: 'تقييم الكشف',
                        backgroundColor: ColorManager.white,
                        textStyle: getRegularStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s24,
                        ),
                        onTap: () => showThemeBottomSheet(
                          context,
                          SingleChildScrollView(
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: Sizes.s60.h,
                                  ),
                                  Text(
                                    "اضف تقييمك",
                                    style: getBoldStyle(
                                      color: ColorManager.black,
                                      fontSize: FontSize.s32,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Sizes.s20.h,
                                  ),
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 0,
                                    maxRating: 5,
                                    textDirection: TextDirection.ltr,
                                    unratedColor:
                                        ColorManager.black.withOpacity(.06),
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 40,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      size: 20,
                                      color: ColorManager.yellow,
                                    ),
                                    onRatingUpdate: (rating) {
                                      if (kDebugMode) {
                                        print(rating);
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: Sizes.s20.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Insets.s24),
                                    child: CustomTextField(
                                        hint: 'شاركنا رأيك...',
                                        maxLines: 7,
                                        widthBorderSide: 1,
                                        borderRadius: 25.r,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: ColorManager.primary
                                                    .withOpacity(.25),
                                                blurRadius: 10,
                                                spreadRadius: 1,
                                                offset: const Offset(0, 4))
                                          ],
                                        ),
                                        backgroundColor: ColorManager.white,
                                        validation: Validator.validateFullName,
                                        textInputType: TextInputType.text,
                                        controller: _opinionController,
                                        borderBackgroundColor:
                                            ColorManager.primary),
                                  ),
                                  SizedBox(
                                    height: Sizes.s20.h,
                                  ),
                                  Center(
                                    child: CustomElevatedButton(
                                      label: 'ارسال',
                                      onTap: () => Navigator.pushNamed(
                                          context, Routes.sendRateSuccess),
                                      maximumSize: const Size(260, 55),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Sizes.s20.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        maximumSize: const Size(260, 55),
                      ),
                    ),
              SizedBox(
                height: Sizes.s24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showThemeBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: ColorManager.springWood,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: child,
      ),
    );
  }
}
