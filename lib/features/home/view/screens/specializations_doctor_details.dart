import 'package:clinic_system_patient/core/resources/values_manager.dart';
import 'package:clinic_system_patient/features/home/view/widgets/home_tab/widgets/famous_doctor_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../data/models/famous_doc_model.dart';

class SpecializationsDoctorDetails extends StatefulWidget {
  const SpecializationsDoctorDetails({super.key});

  @override
  State<SpecializationsDoctorDetails> createState() =>
      _SpecializationsDoctorDetailsState();
}

class _SpecializationsDoctorDetailsState
    extends State<SpecializationsDoctorDetails> {
  final _searchController = TextEditingController();
  List<FamousDocModel> specialDoc = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    if (args.id == '1') {
      specialDoc = [
        FamousDocModel(
          name: "د / محمد خالد ",
          experience: ' 7 سنوات',
          rating: 5,
          imageDoctor: ImageAssets.famousDoctor,
          price: 200,
          specialtyTitle: " باطنه",
        ),
        FamousDocModel(
          name: "د / احمد ابراهيم",
          experience: ' 10 سنوات',
          rating: 4.5,
          imageDoctor: ImageAssets.famousDoctor,
          price: 250,
          specialtyTitle: " باطنه",
        ),
        FamousDocModel(
          name: "د / حسام يوسف",
          experience: ' 3 سنوات',
          rating: 4,
          imageDoctor: ImageAssets.famousDoctor,
          price: 150,
          specialtyTitle: " باطنه",
        ),
      ];
    } else if (args.id == '2') {
      specialDoc = [
        FamousDocModel(
          name: "د / يوسف محمد ",
          experience: ' 6 سنوات',
          rating: 4.5,
          imageDoctor: ImageAssets.famousDoctor3,
          price: 250,
          specialtyTitle: " أسنان",
        ),
        FamousDocModel(
          name: "د / ريم مصطفى",
          experience: ' 10 سنوات',
          rating: 5,
          imageDoctor: ImageAssets.famousDoctor2,
          price: 350,
          specialtyTitle: " أسنان",
        ),
        FamousDocModel(
          name: "د / آيه فهمى",
          experience: ' 3 سنوات',
          rating: 4,
          imageDoctor: ImageAssets.famousDoctor2,
          price: 200,
          specialtyTitle: " أسنان",
        ),
      ];
    } else if (args.id == '3') {
      specialDoc = [
        FamousDocModel(
          name: "د / روان ابراهيم",
          experience: ' 4 سنوات',
          rating: 4,
          imageDoctor: ImageAssets.famousDoctor4,
          price: 100,
          specialtyTitle: " عظام",
        ),
        FamousDocModel(
          name: "د / عبدالله الشيخ",
          experience: ' 10 سنوات',
          rating: 5,
          imageDoctor: ImageAssets.famousDoctor,
          price: 300,
          specialtyTitle: " عظام",
        ),
        FamousDocModel(
          name: "د / محمود الصاوى",
          experience: ' 7 سنوات',
          rating: 4.5,
          imageDoctor: ImageAssets.famousDoctor,
          price: 200,
          specialtyTitle: " عظام",
        ),
      ];
    } else {
      specialDoc = [
        FamousDocModel(
          name: "د / ياسمين خالد ",
          experience: ' 5 سنوات',
          rating: 4.5,
          imageDoctor: ImageAssets.famousDoctor2,
          price: 300,
          specialtyTitle: " جلدية",
        ),
        FamousDocModel(
          name: "د / جميله النجار",
          experience: ' 10 سنوات',
          rating: 5,
          imageDoctor: ImageAssets.famousDoctor2,
          price: 500,
          specialtyTitle: " جلدية",
        ),
        FamousDocModel(
          name: "د / منه ياسر",
          experience: ' 3 سنوات',
          rating: 4,
          imageDoctor: ImageAssets.famousDoctor2,
          price: 150,
          specialtyTitle: " جلدية",
        ),
      ];
    }
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
        title: Text(
          " أطباء ${args.title}",
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: Insets.s24,
              right: Insets.s24,
              bottom: Insets.s20,
              top: Insets.s10,
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
                  "ابحث عن طبيبك المفضل",
                  style: getRegularStyle(
                    color: ColorManager.black.withOpacity(.30),
                    fontSize: FontSize.s15,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
                child: FamousDoctorItems(
                  famousDocModel: specialDoc[index],
                  isHome: true,
                ),
              ),
              separatorBuilder: (_, index) => SizedBox(
                height: Sizes.s15.h,
              ),
              itemCount: specialDoc.length,
            ),
          ),
        ],
      ),
    );
  }
}
