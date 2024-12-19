import 'package:clinic_system_patient/core/resources/color_manager.dart';
import 'package:clinic_system_patient/core/resources/values_manager.dart';
import 'package:clinic_system_patient/features/home/view/widgets/home_tab/home_tab.dart';
import 'package:clinic_system_patient/features/notifications/view/widgets/notifications_tab.dart';
import 'package:clinic_system_patient/features/profile/view/widgets/profile_tab.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../appointments/view/widgets/appointments_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    AppointmentsTab(),
    NotificationsTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        height: Sizes.s100,
        elevation: 0,
        color: ColorManager.springWood,
        padding: EdgeInsets.zero,
        child: CurvedNavigationBar(
          backgroundColor: ColorManager.springWood,
          animationCurve: Curves.decelerate,
          height: Sizes.s80.h,
          index: _selectedIndex,
          items: [
            CurvedNavigationBarItem(
              label: 'الصفحة الرئيسية',
              labelStyle: _selectedIndex == 0
                  ? getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s12,
                    )
                  : getRegularStyle(
                      color: ColorManager.grayishBlue,
                      fontSize: FontSize.s12,
                    ),
              child: ImageIcon(
                color: _selectedIndex == 0
                    ? ColorManager.primary
                    : ColorManager.grayishBlue,
                AssetImage(
                  _selectedIndex != 0
                      ? ImageAssets.homeIconImg
                      : ImageAssets.homeIconImgColored,
                ),
              ),
            ),
            CurvedNavigationBarItem(
              child: ImageIcon(
                color: _selectedIndex == 1
                    ? ColorManager.primary
                    : ColorManager.grayishBlue,
                AssetImage(
                  _selectedIndex == 1
                      ? ImageAssets.calendarCheckIconImgColored
                      : ImageAssets.calendarCheckIconImg,
                ),
              ),
              label: 'المواعيد',
              labelStyle: _selectedIndex == 1
                  ? getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s12,
                    )
                  : getRegularStyle(
                      color: ColorManager.grayishBlue,
                      fontSize: FontSize.s12,
                    ),
            ),
            CurvedNavigationBarItem(
              child: ImageIcon(
                color: _selectedIndex == 2
                    ? ColorManager.primary
                    : ColorManager.grayishBlue,
                AssetImage(
                  _selectedIndex == 2
                      ? ImageAssets.notificationIconImgColored
                      : ImageAssets.notificationIconImg,
                ),
              ),
              label: 'الاشعارات',
              labelStyle: _selectedIndex == 2
                  ? getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s12,
                    )
                  : getRegularStyle(
                      color: ColorManager.grayishBlue,
                      fontSize: FontSize.s12,
                    ),
            ),
            CurvedNavigationBarItem(
              child: ImageIcon(
                color: _selectedIndex == 3
                    ? ColorManager.primary
                    : ColorManager.grayishBlue,
                AssetImage(
                  _selectedIndex == 3
                      ? ImageAssets.userIconImgColored
                      : ImageAssets.userIconImg,
                ),
              ),
              label: 'الملف',
              labelStyle: _selectedIndex == 3
                  ? getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s12,
                    )
                  : getRegularStyle(
                      color: ColorManager.grayishBlue,
                      fontSize: FontSize.s12,
                    ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: tabs,
      ),
    );
  }
}
