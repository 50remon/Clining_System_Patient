import 'package:clinic_system_patient/core/resources/assets_manager.dart';
import 'package:clinic_system_patient/features/home/data/models/famous_doc_model.dart';
import 'package:clinic_system_patient/features/home/data/models/offer_model.dart';
import 'package:clinic_system_patient/features/home/data/models/specializations_model.dart';
import 'package:clinic_system_patient/features/home/view/widgets/home_tab/widgets/famous_doctor_items.dart';
import 'package:clinic_system_patient/features/home/view/widgets/home_tab/widgets/last_offer_items.dart';
import 'package:clinic_system_patient/features/home/view/widgets/home_tab/widgets/next_appointment.dart';
import 'package:clinic_system_patient/features/home/view/widgets/home_tab/widgets/specializations_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import 'custom_list_view_with_label.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<SpecializationsModel> specializations = [
    SpecializationsModel(
        id: '1', title: 'باطنه', imageName: ImageAssets.stomach),
    SpecializationsModel(
        id: '2', title: 'أسنان', imageName: ImageAssets.dendist),
    SpecializationsModel(
        id: '3', title: 'عظام', imageName: ImageAssets.orthopedic),
    SpecializationsModel(
        id: '4', title: 'جلدية', imageName: ImageAssets.allergy)
  ];
  List<FamousDocModel> famousDoc = [
    FamousDocModel(
      name: "د / محمد ",
      experience: ' 7 سنوات',
      rating: 5,
      specialtyTitle: " باطنه",
      specialtyImage: ImageAssets.stomach,
      imageDoctor: ImageAssets.famousDoctor,
      price: 200,
    ),
    FamousDocModel(
      name: "د / ياسمين  ",
      experience: ' 5 سنوات',
      rating: 4.5,
      specialtyTitle: " جلدية",
      specialtyImage: ImageAssets.allergy,
      imageDoctor: ImageAssets.famousDoctor2,
      price: 300,
    ),
    FamousDocModel(
      name: "د / يوسف  ",
      experience: ' 6 سنوات',
      rating: 4.5,
      specialtyTitle: " أسنان",
      specialtyImage: ImageAssets.dendist,
      imageDoctor: ImageAssets.famousDoctor3,
      price: 250,
    ),
    FamousDocModel(
      name: "د / روان  ",
      experience: ' 4 سنوات',
      rating: 4,
      specialtyTitle: " عظام",
      specialtyImage: ImageAssets.orthopedic,
      imageDoctor: ImageAssets.famousDoctor4,
      price: 100,
    ),
  ];
  List<OfferModel> offers = [
    OfferModel(
        offerText:
            "احجز الآن و احصل على أسنان ناصعة البياض مع خصومات تصل لـ 50%",
        offerImage: ImageAssets.offerImg,
        id: '2',
        title: 'أسنان'),
    OfferModel(
        offerText:
            "الحقى الفرصه و احصلى على بشره ناعمه خاليه من الحبوب و الشوائب بخصومات تصل لـ 30%",
        offerImage: ImageAssets.offerImg2,
        id: '4',
        title: 'جلدية'),
    OfferModel(
        offerText:
            "احجز الآن و قل وداعا لآلام العظام و المفاصل مع نخبة من أمهر الأطباء و المتخصصين",
        offerImage: ImageAssets.offerImg3,
        id: '3',
        title: 'عظام')
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "يوم سعيد محمد",
                      style: getMediumStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s18,
                      ),
                    ),
                    Text(
                      "كيف حالك؟",
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s26,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Image.asset(
                    ImageAssets.hdImgHome,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "M7md Henedy",
                      style: getRegularStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s15,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "24 سنه ,",
                          style: getRegularStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s15,
                          ),
                        ),
                        const Icon(
                          Icons.male,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    ImageAssets.avatarImg,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: Insets.s24,
                      right: Insets.s24,
                      top: Insets.s10,
                      bottom: Insets.s20,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: Insets.s15, vertical: Insets.s15),
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.r),
                        ),
                        border: Border.all(
                          width: .1,
                          color: ColorManager.black.withOpacity(.25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            offset: const Offset(-2, 2),
                            color: ColorManager.black.withOpacity(.15),
                          )
                        ]),
                    child: Row(
                      children: [
                        Image.asset(ImageAssets.searchNormal),
                        SizedBox(
                          width: Sizes.s10.h,
                        ),
                        Text(
                          "عن ما تبحث؟",
                          style: getRegularStyle(
                            color: ColorManager.black.withOpacity(.30),
                            fontSize: FontSize.s15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomListViewWithLabel(
                    label: 'التخصصات',
                    itemBuilder: (_, index) => SpecializationsItems(
                      specializationsModel: specializations[index],
                    ),
                    itemCount: specializations.length,
                    heightListView: 81,
                  ),
                  const NextAppointment(),
                  CustomListViewWithLabel(
                    label: 'أشهر الأطباء',
                    itemBuilder: (_, index) => FamousDoctorItems(
                      famousDocModel: famousDoc[index],
                    ),
                    itemCount: famousDoc.length,
                    heightListView: 157,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: Insets.s16),
                    child: CustomListViewWithLabel(
                      label: 'آخر العروض',
                      itemBuilder: (_, index) => LastOfferItems(
                        offerModel: offers[index],
                      ),
                      itemCount: offers.length,
                      heightListView: 123,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
