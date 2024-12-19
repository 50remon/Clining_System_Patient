import 'package:clinic_system_patient/core/resources/color_manager.dart';
import 'package:clinic_system_patient/features/appointments/data/models/appointments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_elevated_button.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppointmentsModel args =
        ModalRoute.of(context)!.settings.arguments as AppointmentsModel;
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
          "تشخيص الطبيب",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
          child: Column(
            children: [
              SizedBox(
                height: Sizes.s10.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Insets.s16, vertical: Insets.s24),
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      width: 1,
                      color: ColorManager.primary,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: ColorManager.primary.withOpacity(.25),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(0, 4))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "تشخيص الحالة:",
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s20,
                      ),
                    ),
                    SizedBox(
                      height: Sizes.s10.h,
                    ),
                    Text(
                      'بعد فحص الأعراض ومراجعة التحاليل، يتضح أن المريض يعاني من التهاب المعدة. الأعراض تشمل آلام في الجزء العلوي من البطن، غثيان، وشعور بالحموضة بشكل مستمر. الالتهاب ممكن يكون ناتج عن عدوى بكتيريا "هيلوباكتر بيلوري" أو نتيجة نمط حياة غير صحي، مثل الإفراط في تناول الأطعمة الحارة أو الكافيين، أو حتى الإجهاد الزائد.',
                      style: getRegularStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Sizes.s20.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Insets.s16, vertical: Insets.s24),
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      width: 1,
                      color: ColorManager.primary,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: ColorManager.primary.withOpacity(.25),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(0, 4))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "روشتة العلاج:",
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s20,
                      ),
                    ),
                    SizedBox(
                      height: Sizes.s10.h,
                    ),
                    Text(
                      '• أوميبرازول (Omeprazole) 20 ملجم: قرص صباحًا على معدة فاضية لمدة 14 يوم، لتقليل إفراز الأحماض بالمعدة.\n'
                      '• ميترونيدازول (Metropolitan) 500 ملجم: قرص مرتين يوميًا لمدة 7 أيام.\n•'
                      ' ماغنسيوم هيدروكسيد وألومنيوم هيدروكسيد (Favicons): 10 مل بعد الأكل وعند الشعور بالحموضة، لتخفيف الحموضة فورًا.',
                      style: getRegularStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Sizes.s20.h,
              ),
              Center(
                child: CustomElevatedButton(
                  label: 'استشارة الطبيب',
                  onTap: () => Navigator.pushNamed(
                    context,
                    Routes.chat,
                    arguments: args,
                  ),
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
