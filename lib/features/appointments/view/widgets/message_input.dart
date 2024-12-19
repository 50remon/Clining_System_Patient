import 'package:clinic_system_patient/core/resources/color_manager.dart';
import 'package:clinic_system_patient/core/resources/styles_manager.dart';
import 'package:clinic_system_patient/core/resources/values_manager.dart';
import 'package:clinic_system_patient/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  MessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.s140.h,
      padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: CircleAvatar(
              radius: 20,
              backgroundColor: ColorManager.primary,
              child: Icon(
                Icons.send,
                color: ColorManager.white,
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
          SizedBox(
            width: Sizes.s10.w,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Insets.s16),
              child: CustomTextField(
                hint: "اكتب رسالتك هنا...",
                backgroundColor: ColorManager.springWood,
                borderBackgroundColor: ColorManager.springWood,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.black.withOpacity(.10),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(-2, 2),
                    ),
                  ],
                ),
                hintTextStyle: getRegularStyle(
                    color: ColorManager.black, fontSize: Sizes.s15),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt_outlined,
              color: ColorManager.black.withOpacity(.5),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.attach_file,
              color: ColorManager.black.withOpacity(.5),
            ),
          ),
        ],
      ),
    );
  }
}
