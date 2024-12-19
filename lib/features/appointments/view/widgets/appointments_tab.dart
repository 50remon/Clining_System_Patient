import 'package:clinic_system_patient/features/appointments/data/models/appointments_model.dart';
import 'package:clinic_system_patient/features/appointments/data/models/tabs_model.dart';
import 'package:clinic_system_patient/features/appointments/view/widgets/appointments_widget.dart';
import 'package:clinic_system_patient/features/appointments/view/widgets/tab_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';

class AppointmentsTab extends StatefulWidget {
  const AppointmentsTab({super.key});

  @override
  State<AppointmentsTab> createState() => _AppointmentsTabState();
}

class _AppointmentsTabState extends State<AppointmentsTab> {
  List<TabsModel> tabs = [
    TabsModel(id: '1', name: "القادمة"),
    TabsModel(id: '2', name: "المكتملة"),
    TabsModel(id: '3', name: "الملغية"),
  ];
  int selectedIndex = 0;
  List<AppointmentsModel> appointments = List.generate(
    3,
    (index) => AppointmentsModel(
      numberTurn: 5,
      typeAppointments: "باطنه",
      docName: "د / محمد خالد",
      data: "يوم الخميس 24/10/2024",
      time: "من 10:00 ص الى 10:30 ص",
      imageDoc: ImageAssets.famousDoctor,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Insets.s24,
              vertical: Insets.s20,
            ),
            child: Center(
              child: Text(
                "جدول المواعيد",
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s24,
                ),
              ),
            ),
          ),
          DefaultTabController(
            length: tabs.length,
            child: TabBar(
              isScrollable: true,
              padding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              tabAlignment: TabAlignment.center,
              onTap: (index) => setState(() {
                selectedIndex = index;
              }),
              tabs: tabs
                  .map(
                    (tab) => TabItems(
                      title: tab.name,
                      isSelected: tabs.indexOf(tab) == selectedIndex,
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(
            height: Sizes.s20.h,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => AppointmentsWidget(
                selectedIndex: selectedIndex,
                appointmentsModel: appointments[index],
              ),
              separatorBuilder: (_, index) => SizedBox(
                height: Sizes.s20.h,
              ),
              itemCount: appointments.length,
            ),
          ),
        ],
      ),
    );
  }
}
