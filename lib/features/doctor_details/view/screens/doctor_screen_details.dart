import 'package:clinic_system_patient/core/resources/color_manager.dart';
import 'package:clinic_system_patient/core/resources/values_manager.dart';
import 'package:clinic_system_patient/core/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../home/data/models/famous_doc_model.dart';

class DoctorScreenDetails extends StatelessWidget {
  const DoctorScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    FamousDocModel args =
        ModalRoute.of(context)!.settings.arguments as FamousDocModel;
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
          " ${args.name}",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Insets.s24,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          color: ColorManager.primary,
                        ),
                      ),
                      child: args.imageDoctor == null
                          ? const SizedBox()
                          : Image.asset(
                              args.imageDoctor!,
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
                      Text(
                        "تخصص :${args.specialtyTitle}",
                        style: getRegularStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s18,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "تقييم : ",
                            style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s18,
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: args.rating,
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
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: Sizes.s10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "خبرة :${args.experience}",
                        style: getRegularStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s18,
                        ),
                      ),
                      Text(
                        "سعر الكشف : ${args.price} ج م",
                        style: getRegularStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Sizes.s15.h,
                  ),
                  Text(
                    "عن الطبيب",
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  SizedBox(
                    height: Sizes.s10.h,
                  ),
                  Text(
                    "استشاري الأمراض الباطنية، متخصص في تشخيص وعلاج مجموعة واسعة من الأمراض المتعلقة بالجهاز الهضمي، الجهاز التنفسي، والكلى. يتمتع بخبرة تزيد عن 7 سنوات في مجال الطب الباطني",
                    style: getRegularStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  SizedBox(
                    height: Sizes.s15.h,
                  ),
                  Text(
                    "بعض الآراء و تقييمات",
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  SizedBox(
                    height: Sizes.s15.h,
                  ),
                ],
              ),
            ),
            SliverList.separated(
              itemBuilder: (_, index) => Row(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: ColorManager.transparent,
                    backgroundImage: const AssetImage(ImageAssets.ratingImage),
                  ),
                  SizedBox(
                    width: Sizes.s10.w,
                  ),
                  Expanded(
                    child: Text(
                      "دكتور شاطر جداً ومريح في التعامل. الحمد لله بعد العلاج اتحسنت حالتي جداً",
                      style: getRegularStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s18,
                      ),
                    ),
                  ),
                ],
              ),
              separatorBuilder: (_, index) => const Divider(),
              itemCount: 3,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: Sizes.s40.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: CustomElevatedButton(
                  label: 'احجز الآن',
                  onTap: () =>
                      Navigator.of(context).pushNamed(Routes.reservation),
                  maximumSize: const Size(260, 55),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: Sizes.s15.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
