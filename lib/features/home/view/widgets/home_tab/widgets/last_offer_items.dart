import 'package:clinic_system_patient/features/home/data/models/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/font_manager.dart';
import '../../../../../../core/resources/styles_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/routes/routes.dart';

class LastOfferItems extends StatelessWidget {
  const LastOfferItems({super.key, required this.offerModel});

  final OfferModel offerModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(Routes.specializationsDetails, arguments: offerModel),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(25.r),
          ),
          gradient: LinearGradient(
            begin: AlignmentDirectional.centerEnd,
            end: AlignmentDirectional.centerStart,
            colors: [
              ColorManager.babyBlue,
              ColorManager.cornflowerBlue,
              ColorManager.primary,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  end: Insets.s8, start: Insets.s10),
              child: SizedBox(
                width: Sizes.s180,
                child: Text(
                  offerModel.offerText,
                  style: getBoldStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s14,
                  ),
                ),
              ),
            ),
            offerModel.offerImage == null
                ? const SizedBox()
                : Image.asset(
                    offerModel.offerImage!,
                    fit: BoxFit.cover,
                    width: Sizes.s180,
                    height: Sizes.s123,
                  )
          ],
        ),
      ),
    );
  }
}
