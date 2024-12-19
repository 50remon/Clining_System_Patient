import 'package:clinic_system_patient/core/resources/font_manager.dart';
import 'package:clinic_system_patient/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/default_drop_btn.dart';

class PersonalDataChange extends StatefulWidget {
  const PersonalDataChange({super.key});

  @override
  State<PersonalDataChange> createState() => _PersonalDataChangeState();
}

class _PersonalDataChangeState extends State<PersonalDataChange> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _lengthController = TextEditingController();

  @override
  void initState() {
    _nameController.text = 'Remon Fayez';
    _emailController.text = 'rymwnfayz707@gmail.com';
    _phoneController.text = '01226026985';
    _ageController.text = '23 سنه';
    _weightController.text = ' 74 كجم ';
    _lengthController.text = '185سم';

    super.initState();
  }

  String lang = "ذكر";

  @override
  Widget build(BuildContext context) {
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
          "تعديل الملف الشخصى",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
          child: Column(
            children: [
              SizedBox(
                height: Sizes.s20.h,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 80.r,
                      backgroundColor: ColorManager.white,
                      backgroundImage: const AssetImage(
                        ImageAssets.avatarImg,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: -5,
                      child: InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: ColorManager.black,
                          child: ImageIcon(
                            color: ColorManager.white,
                            size: 20,
                            const AssetImage(
                              ImageAssets.iconImageEdit,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Sizes.s20.h,
              ),
              CustomTextField(
                backgroundColor: ColorManager.white,
                label: 'الاسم',
                contentPadding: EdgeInsets.all(Insets.s8.sp),
                textStyle: getRegularStyle(
                    color: ColorManager.black, fontSize: FontSize.s20),
                labelTextStyle: getRegularStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s12,
                ),
                cursorColor: ColorManager.primary,
                textInputType: TextInputType.text,
                validation: Validator.validateFullName,
                controller: _nameController,
              ),
              SizedBox(
                height: Sizes.s10.h,
              ),
              CustomTextField(
                backgroundColor: ColorManager.white,
                label: 'الايميل',
                contentPadding: EdgeInsets.all(Insets.s8.sp),
                textStyle: getRegularStyle(
                    color: ColorManager.black, fontSize: FontSize.s20),
                labelTextStyle: getRegularStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s12,
                ),
                cursorColor: ColorManager.primary,
                textInputType: TextInputType.text,
                validation: Validator.validateEmail,
                controller: _emailController,
              ),
              SizedBox(
                height: Sizes.s10.h,
              ),
              CustomTextField(
                backgroundColor: ColorManager.white,
                label: 'الموبايل',
                contentPadding: EdgeInsets.all(Insets.s8.sp),
                textStyle: getRegularStyle(
                    color: ColorManager.black, fontSize: FontSize.s20),
                labelTextStyle: getRegularStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s12,
                ),
                cursorColor: ColorManager.primary,
                textInputType: TextInputType.phone,
                validation: Validator.validatePhoneNumber,
                controller: _phoneController,
              ),
              SizedBox(
                height: Sizes.s10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 130,
                    child: CustomTextField(
                      backgroundColor: ColorManager.white,
                      label: 'السن ',
                      contentPadding: EdgeInsets.zero,
                      textStyle: getRegularStyle(
                          color: ColorManager.black, fontSize: FontSize.s20),
                      labelTextStyle: getRegularStyle(
                        color: ColorManager.primary,
                        fontSize: FontSize.s12,
                      ),
                      cursorColor: ColorManager.primary,
                      textInputType: TextInputType.text,
                      validation: Validator.validateFullName,
                      controller: _ageController,
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    child: DefaultDropBtn(
                      label: 'الجنس',
                      labelTextStyle: getRegularStyle(
                        color: ColorManager.primary,
                        fontSize: FontSize.s12,
                      ),
                      decoration: const BoxDecoration(),
                      currentValue: lang,
                      firstValue: 'ذكر',
                      secondValue: 'اثني',
                      firstTitle: "ذكر",
                      secondTitle: "اثني",
                      onChanged: (value) {
                        lang = value!;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Sizes.s10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 130,
                    child: CustomTextField(
                      backgroundColor: ColorManager.white,
                      label: 'الطول ',
                      contentPadding: EdgeInsets.zero,
                      textStyle: getRegularStyle(
                          color: ColorManager.black, fontSize: FontSize.s20),
                      labelTextStyle: getRegularStyle(
                        color: ColorManager.primary,
                        fontSize: FontSize.s12,
                      ),
                      cursorColor: ColorManager.primary,
                      textInputType: TextInputType.text,
                      validation: Validator.validateFullName,
                      controller: _lengthController,
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    child: CustomTextField(
                      backgroundColor: ColorManager.white,
                      label: 'الوزن',
                      contentPadding: EdgeInsets.zero,
                      textStyle: getRegularStyle(
                          color: ColorManager.black, fontSize: FontSize.s20),
                      labelTextStyle: getRegularStyle(
                        color: ColorManager.primary,
                        fontSize: FontSize.s12,
                      ),
                      cursorColor: ColorManager.primary,
                      textInputType: TextInputType.text,
                      validation: Validator.validateFullName,
                      controller: _weightController,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Sizes.s20.h,
              ),
              CustomElevatedButton(
                label: 'حفظ ',
                onTap: () {},
                maximumSize: const Size(260, 55),
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
