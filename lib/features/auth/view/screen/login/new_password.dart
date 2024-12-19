import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
          "كلمة مرور جديدة",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.s24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Sizes.s60.h,
              ),
              Text(
                "قم بتعيين كلمة مرور جديدة لحسابك",
                style: getRegularStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s15,
                ),
              ),
              SizedBox(
                height: Sizes.s10.h,
              ),
              CustomTextField(
                hint: 'ادخل كلمة مرور جديدة',
                backgroundColor: ColorManager.white,
                validation: Validator.validatePassword,
                isObscured: true,
                textInputType: TextInputType.text,
                controller: _passwordController,
              ),
              SizedBox(
                height: Sizes.s20.h,
              ),
              CustomTextField(
                hint: 'تأكيد كلمة المرور',
                backgroundColor: ColorManager.white,
                validation: Validator.validatePassword,
                isObscured: true,
                textInputType: TextInputType.text,
                controller: _confirmPasswordController,
              ),
              SizedBox(
                height: Sizes.s83.h,
              ),
              CustomElevatedButton(
                  label: 'حفظ كلمة المرور',
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(Routes.resetPasswordSuccess),
                  maximumSize: const Size(219, 55)),
              SizedBox(
                height: Sizes.s40.h,
              ),
              Image.asset(ImageAssets.resetPassword)
            ],
          ),
        ),
      ),
    );
  }
}
