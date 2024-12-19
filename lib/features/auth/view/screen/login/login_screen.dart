import 'package:clinic_system_patient/core/resources/assets_manager.dart';
import 'package:clinic_system_patient/core/resources/font_manager.dart';
import 'package:clinic_system_patient/core/resources/styles_manager.dart';
import 'package:clinic_system_patient/core/resources/values_manager.dart';
import 'package:clinic_system_patient/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../widgets/custom_container_with_image.dart';
import '../../widgets/custom_text_with_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Sizes.s83.h,
                ),
                Text(
                  "مرحبا بعودتك",
                  style: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s40,
                  ),
                ),
                SizedBox(
                  height: Sizes.s8.h,
                ),
                Text(
                  "قم بتسجل الدخول الى حسابك",
                  style: getRegularStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s24,
                  ),
                ),
                SizedBox(
                  height: Sizes.s20.h,
                ),
                CustomTextField(
                  backgroundColor: ColorManager.white,
                  hint: 'البريد الالكترونى / رقم الهاتف / اسم المستخدم',
                  label: 'اسم المستخدم',
                  textInputType: TextInputType.text,
                  validation: Validator.validateEmail,
                  controller: _emailController,
                ),
                SizedBox(
                  height: Sizes.s20.h,
                ),
                CustomTextField(
                  hint: 'ادخل كلمة المرور',
                  backgroundColor: ColorManager.white,
                  label: 'كلمة المرور',
                  validation: Validator.validatePassword,
                  isObscured: true,
                  textInputType: TextInputType.text,
                  controller: _passwordController,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      splashRadius: 5,
                      side: BorderSide(color: ColorManager.primary, width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(Sizes.s5.h))),
                      activeColor: ColorManager.primary,
                      onChanged: (value) {
                        isChecked = value!;
                        setState(() {});
                      },
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                    ),
                    SizedBox(
                      width: Sizes.s2.w,
                    ),
                    Text(
                      "تذكرنى",
                      style: getRegularStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s15,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(Routes.forgotPassword),
                      child: Text(
                        "نسيت كلمة المرور",
                        style: getRegularStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Sizes.s20.h,
                ),
                CustomElevatedButton(
                  label: 'تسجيل الدخول',
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(Routes.home),
                ),
                SizedBox(
                  height: Sizes.s20.h,
                ),
                const CustomTextWithDivider(
                  title: "خيارات تسجيل الدخول",
                ),
                SizedBox(
                  height: Sizes.s20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomContainerWithImage(
                      imgName: ImageAssets.appleImg,
                      onTap: () {},
                    ),
                    CustomContainerWithImage(
                      imgName: ImageAssets.facebookImg,
                      onTap: () {},
                    ),
                    CustomContainerWithImage(
                      imgName: ImageAssets.googleImg,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: Sizes.s20.h,
                ),
                const CustomTextWithDivider(
                  title: "ليس لديك حساب ؟!",
                ),
                SizedBox(
                  height: Sizes.s20.h,
                ),
                TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(Routes.register),
                  child: Text(
                    "انشاء حساب جديد",
                    style: getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s17,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
