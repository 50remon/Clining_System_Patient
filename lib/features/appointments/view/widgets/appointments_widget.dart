import 'package:clinic_system_patient/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../data/models/appointments_model.dart';

class AppointmentsWidget extends StatelessWidget {
  const AppointmentsWidget(
      {super.key,
      required this.selectedIndex,
      required this.appointmentsModel});

  final int selectedIndex;

  final AppointmentsModel appointmentsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: selectedIndex != 2
            ? () => Navigator.pushNamed(context, Routes.appointmentData,
                arguments: [appointmentsModel, selectedIndex])
            : () {},
        child: Container(
          margin: const EdgeInsetsDirectional.only(
              bottom: Insets.s12, start: Insets.s24, end: Insets.s24),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.all(
              Radius.circular(25.r),
            ),
            border: Border.all(
              width: 1,
              color: selectedIndex == 0
                  ? ColorManager.primary
                  : selectedIndex == 1
                      ? ColorManager.green
                      : ColorManager.error,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: const Offset(0, 4),
                spreadRadius: 1,
                color: selectedIndex == 0
                    ? ColorManager.primary.withOpacity(.25)
                    : selectedIndex == 1
                        ? ColorManager.green.withOpacity(.25)
                        : ColorManager.error.withOpacity(.25),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(end: Insets.s24),
                padding: const EdgeInsetsDirectional.only(
                  end: Insets.s8,
                  start: Insets.s8,
                  top: Insets.s8,
                  bottom: Insets.s8,
                ),
                alignment: Alignment.center,
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
                      appointmentsModel.numberTurn.toString(),
                      style: getBoldStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s24,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: Insets.s20,
                  bottom: Insets.s20,
                  end: Insets.s12,
                  start: Insets.s8,
                ),
                child: Column(
                  children: [
                    Text(
                      " كشف ${appointmentsModel.typeAppointments} ",
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s20,
                      ),
                    ),
                    SizedBox(
                      height: Sizes.s5.h,
                    ),
                    Text(
                      appointmentsModel.docName,
                      style: getMediumStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s18,
                      ),
                    ),
                    SizedBox(
                      height: Sizes.s5.h,
                    ),
                    Text(
                      appointmentsModel.data,
                      style: getMediumStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s14,
                      ),
                    ),
                    SizedBox(
                      height: Sizes.s5.h,
                    ),
                    Text(
                      appointmentsModel.time,
                      style: getMediumStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ],
                ),
              ),
              appointmentsModel.imageDoc == null
                  ? const SizedBox()
                  : Image(
                      image: AssetImage(appointmentsModel.imageDoc!),
                      height: Sizes.s140.h,
                      width: Sizes.s80.w,
                      fit: BoxFit.fill,
                    )
            ],
          ),
        ));
  }
}
