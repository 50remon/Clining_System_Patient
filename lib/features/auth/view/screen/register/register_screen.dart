import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../widgets/custom_text_with_divider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  height: Sizes.s55.h,
                ),
                Text(
                  "تسرنا رؤيتك",
                  style: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s40,
                  ),
                ),
                SizedBox(
                  height: Sizes.s8.h,
                ),
                Text(
                  "قم بانشاء حسابك الآن",
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
                  hint: 'ادخل الاسم',
                  label: 'الاسم',
                  textInputType: TextInputType.text,
                  validation: Validator.validateFullName,
                  controller: _nameController,
                ),
                SizedBox(
                  height: Sizes.s20.h,
                ),
                CustomTextField(
                  backgroundColor: ColorManager.white,
                  hint: 'ادخل البريد الالكترونى',
                  label: 'الايميل',
                  textInputType: TextInputType.emailAddress,
                  validation: Validator.validateEmail,
                  controller: _emailController,
                ),
                SizedBox(
                  height: Sizes.s20.h,
                ),
                CustomTextField(
                  backgroundColor: ColorManager.white,
                  hint: 'ادخل رقم الهاتف',
                  label: 'الموبايل',
                  textInputType: TextInputType.phone,
                  validation: Validator.validatePhoneNumber,
                  controller: _phoneController,
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
                SizedBox(
                  height: Sizes.s20.h,
                ),
                CustomElevatedButton(
                  label: 'انشاء حساب',
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(Routes.otpCode),
                ),
                SizedBox(
                  height: Sizes.s36.h,
                ),
                const CustomTextWithDivider(
                  title: "هل لديك حساب بالفعل ؟!",
                ),
                SizedBox(
                  height: Sizes.s20.h,
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed(Routes.login),
                  child: Text(
                    "تسجيل الدخول",
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
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
