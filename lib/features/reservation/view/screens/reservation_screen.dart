import 'package:clinic_system_patient/core/resources/color_manager.dart';
import 'package:clinic_system_patient/core/resources/font_manager.dart';
import 'package:clinic_system_patient/core/resources/styles_manager.dart';
import 'package:clinic_system_patient/core/resources/values_manager.dart';
import 'package:clinic_system_patient/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/default_drop_btn.dart';
import '../widgets/custom_show_date.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  String currentValue = intl.DateFormat('MMMM , yyyy', 'ar').format(
    DateTime(DateTime.now().year, DateTime.now().month),
  );
  List<String> items = List.generate(
    12,
    (index) => intl.DateFormat('MMMM , yyyy', 'ar').format(
      DateTime(DateTime.now().year, index + 1),
    ),
  );
  List<String> valueMonth = intl.DateFormat('MMMM , yyyy', 'ar')
      .format(
        DateTime(DateTime.now().year, DateTime.now().month),
      )
      .split(",");
  List<String> month = List.generate(
      12,
      (index) => intl.DateFormat('MMMM ', 'ar')
          .format(
            DateTime(DateTime.now().year, index + 1),
          )
          .split(",")[0]);
  DateTime focusDate = DateTime.now();
  List<Map<String, dynamic>> timeM = [
    {"time": "09:00 AM", "isAvailable": true},
    {"time": "09:30 AM", "isAvailable": true},
    {"time": "10:00 AM", "isAvailable": true},
    {"time": "10:30 AM", "isAvailable": true},
    {"time": "11:00 AM", "isAvailable": false},
    {"time": "11:30 AM", "isAvailable": false},
    {"time": "12:00 PM", "isAvailable": false},
  ];
  List<Map<String, dynamic>> timeA = [
    {"time": "12:30 PM", "isAvailable": false},
    {"time": "01:00 PM", "isAvailable": false},
    {"time": "01:30 PM", "isAvailable": false},
    {"time": "02:00 PM", "isAvailable": true},
    {"time": "02:30 PM", "isAvailable": true},
    {"time": "03:00 PM", "isAvailable": true},
    {"time": "03:30 PM", "isAvailable": true},
    {"time": "04:00 PM", "isAvailable": true},
    {"time": "04:30 PM", "isAvailable": false},
    {"time": "05:00 PM", "isAvailable": false},
    {"time": "05:30 PM", "isAvailable": false},
  ];
  List<Map<String, dynamic>> timeE = [
    {"time": "06:00 PM", "isAvailable": false},
    {"time": "06:30 PM", "isAvailable": false},
    {"time": "07:00 PM", "isAvailable": false},
    {"time": "07:30 PM", "isAvailable": false},
    {"time": "08:00 PM", "isAvailable": true},
    {"time": "08:30 PM", "isAvailable": true},
    {"time": "09:00 PM", "isAvailable": true},
  ];

  String? _value;

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
          "اختر الموعد المناسب",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultDropBtn(
                currentValue: currentValue,
                alignment: AlignmentDirectional.centerStart,
                isExpanded: false,
                borderRadius: null,
                decoration: null,
                icon: Image.asset(
                  ImageAssets.iconParkOutlineDown,
                ),
                onChanged: (value) {
                  currentValue = value!;
                  valueMonth = currentValue.split(",");
                  setState(() {});
                },
                items: items
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: getBoldStyle(
                                color: ColorManager.black, fontSize: 18),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: Sizes.s10.h,
              ),
              CustomShowDate(
                firstDate: DateTime(
                    DateTime.now().year, month.indexOf(valueMonth[0]) + 1, 1),
                onDateChange: (data) {
                  focusDate = data;
                  setState(() {});
                },
                focusDate: focusDate,
                lastDate: DateTime(
                    DateTime.now().year, month.indexOf(valueMonth[0]) + 2, 1),
              ),
              SizedBox(
                height: Sizes.s10.h,
              ),
              Text(
                "صباحًا",
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s18,
                ),
              ),
              SizedBox(
                height: Sizes.s10.h,
              ),
              Wrap(
                textDirection: TextDirection.ltr,
                alignment: WrapAlignment.center,
                spacing: Sizes.s5.w,
                runSpacing: Sizes.s10.h,
                children: List.generate(
                  timeM.length,
                  (index) => Directionality(
                    textDirection: TextDirection.ltr,
                    child: ChoiceChip(
                      padding: const EdgeInsets.all(Insets.s12),
                      labelStyle: _value == timeM[index]['time'] &&
                              timeM[index]['isAvailable'] == false
                          ? getRegularStyle(
                              color: ColorManager.white, fontSize: FontSize.s14)
                          : getRegularStyle(
                              color: timeM[index]['isAvailable'] == true
                                  ? ColorManager.black.withOpacity(.25)
                                  : ColorManager.black,
                              fontSize: FontSize.s14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        side: BorderSide(
                          width: .2,
                          color: ColorManager.black.withOpacity(.5),
                        ),
                      ),
                      label: Text(
                        timeM[index]['time'],
                      ),
                      showCheckmark: false,
                      backgroundColor: timeM[index]['isAvailable'] == true
                          ? ColorManager.springWood
                          : ColorManager.white,
                      selected: _value == timeM[index]['time'] &&
                          timeM[index]['isAvailable'] == false,
                      selectedColor: ColorManager.primary,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected && timeM[index]['isAvailable']
                              ? null
                              : timeM[index]['time'];
                        });
                      },
                    ),
                  ),
                ).toList(),
              ),
              SizedBox(
                height: Sizes.s10.h,
              ),
              Text(
                "بعد الظهر",
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s18,
                ),
              ),
              SizedBox(
                height: Sizes.s10.h,
              ),
              Wrap(
                textDirection: TextDirection.ltr,
                alignment: WrapAlignment.center,
                spacing: Sizes.s5.w,
                runSpacing: Sizes.s10.h,
                children: List.generate(
                  timeA.length,
                  (index) => Directionality(
                    textDirection: TextDirection.ltr,
                    child: ChoiceChip(
                      padding: const EdgeInsets.all(Insets.s12),
                      labelStyle: _value == timeA[index]['time'] &&
                              timeA[index]['isAvailable'] == false
                          ? getRegularStyle(
                              color: ColorManager.white, fontSize: FontSize.s14)
                          : getRegularStyle(
                              color: timeA[index]['isAvailable'] == true
                                  ? ColorManager.black.withOpacity(.25)
                                  : ColorManager.black,
                              fontSize: FontSize.s14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        side: BorderSide(
                          width: .2,
                          color: ColorManager.black.withOpacity(.5),
                        ),
                      ),
                      label: Text(
                        timeA[index]['time'],
                      ),
                      showCheckmark: false,
                      backgroundColor: timeA[index]['isAvailable'] == true
                          ? ColorManager.springWood
                          : ColorManager.white,
                      selected: _value == timeA[index]['time'] &&
                          timeA[index]['isAvailable'] == false,
                      selectedColor: ColorManager.primary,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected && timeA[index]['isAvailable']
                              ? null
                              : timeA[index]['time'];
                        });
                      },
                    ),
                  ),
                ).toList(),
              ),
              SizedBox(
                height: Sizes.s10.h,
              ),
              Text(
                "مساءً",
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s18,
                ),
              ),
              SizedBox(
                height: Sizes.s10.h,
              ),
              Wrap(
                textDirection: TextDirection.ltr,
                alignment: WrapAlignment.center,
                spacing: Sizes.s5.w,
                runSpacing: Sizes.s10.h,
                children: List.generate(
                  timeE.length,
                  (index) => Directionality(
                    textDirection: TextDirection.ltr,
                    child: ChoiceChip(
                      padding: const EdgeInsets.all(Insets.s12),
                      labelStyle: _value == timeE[index]['time'] &&
                              timeE[index]['isAvailable'] == false
                          ? getRegularStyle(
                              color: ColorManager.white, fontSize: FontSize.s14)
                          : getRegularStyle(
                              color: timeE[index]['isAvailable'] == true
                                  ? ColorManager.black.withOpacity(.25)
                                  : ColorManager.black,
                              fontSize: FontSize.s14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        side: BorderSide(
                          width: .2,
                          color: ColorManager.black.withOpacity(.5),
                        ),
                      ),
                      label: Text(
                        timeE[index]['time'],
                      ),
                      showCheckmark: false,
                      backgroundColor: timeE[index]['isAvailable'] == true
                          ? ColorManager.springWood
                          : ColorManager.white,
                      selected: _value == timeE[index]['time'] &&
                          timeE[index]['isAvailable'] == false,
                      selectedColor: ColorManager.primary,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected && timeE[index]['isAvailable']
                              ? null
                              : timeE[index]['time'];
                        });
                      },
                    ),
                  ),
                ).toList(),
              ),
              SizedBox(
                height: Sizes.s60.h,
              ),
              Center(
                child: CustomElevatedButton(
                  label: 'حجز الموعد',
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(Routes.reservationSuccess),
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
    );
  }
}
