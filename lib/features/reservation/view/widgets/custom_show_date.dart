import 'package:clinic_system_patient/core/resources/color_manager.dart';
import 'package:clinic_system_patient/core/resources/font_manager.dart';
import 'package:clinic_system_patient/core/resources/styles_manager.dart';
import 'package:clinic_system_patient/core/resources/values_manager.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShowDate extends StatelessWidget {
  const CustomShowDate(
      {super.key,
      this.onDateChange,
      this.focusDate,
      this.firstDate,
      this.lastDate});

  final Function(DateTime)? onDateChange;
  final DateTime? focusDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  Widget build(BuildContext context) {
    return EasyInfiniteDateTimeLine(
      dayProps: EasyDayProps(
        height: Sizes.s90.h,
        width: Sizes.s80.w,
        inactiveDayStyle: DayStyle(
          dayNumStyle: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s24),
          dayStrStyle: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            color: ColorManager.white,
            border: Border.all(
              color: ColorManager.white,
              width: 1,
            ),
          ),
        ),
        dayStructure: DayStructure.dayNumDayStr,
        todayStyle: DayStyle(
          dayNumStyle: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s24),
          dayStrStyle: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            color: ColorManager.white,
            border: Border.all(color: ColorManager.white, width: 1),
          ),
        ),
        activeDayStyle: DayStyle(
          dayNumStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s24),
          dayStrStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            color: ColorManager.primary,
            border: Border.all(color: ColorManager.white, width: 1),
          ),
        ),
      ),
      showTimelineHeader: false,
      locale: "ar_eg",
      firstDate:
          firstDate ?? DateTime(DateTime.now().year, DateTime.now().month, 1),
      focusDate: focusDate ?? DateTime.now(),
      lastDate: lastDate ??
          DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
      onDateChange: onDateChange,
    );
  }
}
