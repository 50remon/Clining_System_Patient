import 'package:clinic_system_patient/core/resources/assets_manager.dart';
import 'package:clinic_system_patient/features/home/data/models/famous_doc_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/font_manager.dart';
import '../../../../../../core/resources/styles_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/routes/routes.dart';

class FamousDoctorItems extends StatelessWidget {
  const FamousDoctorItems(
      {super.key, required this.famousDocModel, this.isHome = false});

  final FamousDocModel famousDocModel;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(Routes.doctorDetails, arguments: famousDocModel),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(25.r),
          ),
          border: Border.all(
            width: .2,
            color: ColorManager.springWood,
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              ColorManager.white,
              ColorManager.springWood,
              ColorManager.platinum,
              ColorManager.lightGrey
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: Insets.s16,
                bottom: Insets.s10,
                top: Insets.s10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    famousDocModel.name,
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  Text(
                    "خبرة${famousDocModel.experience}",
                    style: getRegularStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s15,
                    ),
                  ),
                  SizedBox(
                    height: Sizes.s5.h,
                  ),
                  RatingBar.builder(
                    initialRating: famousDocModel.rating,
                    minRating: 0,
                    maxRating: 5,
                    textDirection: TextDirection.ltr,
                    unratedColor: ColorManager.black.withOpacity(.06),
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    itemCount: 5,
                    itemSize: 20,
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
                    height: Sizes.s10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Insets.s8,
                          vertical: Insets.s5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25.r),
                          ),
                          color: ColorManager.black.withOpacity(.1),
                        ),
                        child: Row(
                          children: [
                            Text(
                              isHome
                                  ? "سعر الكشف"
                                  : "تخصص${famousDocModel.specialtyTitle}",
                              style: getRegularStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s15,
                              ),
                            ),
                            SizedBox(
                              width: Sizes.s10.w,
                            ),
                            isHome
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Insets.s5,
                                        vertical: Insets.s5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                        color: ColorManager.white),
                                    child: Text(
                                      "${famousDocModel.price} ج م",
                                      style: getRegularStyle(
                                        color: ColorManager.black,
                                        fontSize: FontSize.s15,
                                      ),
                                    ),
                                  )
                                : famousDocModel.specialtyImage == null
                                    ? const SizedBox()
                                    : CircleAvatar(
                                        radius: 18.r,
                                        backgroundColor: ColorManager.white,
                                        child: Image.asset(
                                          famousDocModel.specialtyImage!,
                                          height: Sizes.s20.h,
                                          width: Sizes.s20.w,
                                        ),
                                      )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Sizes.s10.w,
                      ),
                      CircleAvatar(
                          radius: 20.r,
                          backgroundColor: ColorManager.white,
                          child: Image.asset(
                            ImageAssets.phoneInTalk,
                          ))
                    ],
                  ),
                ],
              ),
            ),
            famousDocModel.imageDoctor == null
                ? const SizedBox()
                : Image.asset(
                    famousDocModel.imageDoctor!,
                    height: Sizes.s140.h,
                    width: Sizes.s100.w,
                    fit: BoxFit.fill,
                  )
          ],
        ),
      ),
    );
  }
}
