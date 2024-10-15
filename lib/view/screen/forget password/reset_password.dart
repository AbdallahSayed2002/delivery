import 'package:delivery/controller/forgetPassword/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/core/functions/alert_exit_app.dart';
import 'package:delivery/core/functions/valid_input.dart';
import 'package:delivery/view/widgets/auth/custom_text_field.dart';
import 'package:delivery/view/widgets/onboarding/custom_button.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.loginPageColor,
      body: WillPopScope(
        onWillPop: () {
          return alertExitApp();
        },
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.005),
              child: Form(
                key: controller.formState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      'Reset Password',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    GetBuilder<ResetPasswordControllerImp>(
                      builder: (controller) => CustomTextField(
                        valid: (val) {
                          return validInput(val!, 5, 40, 'password');
                        },
                        labelText: 'New Password',
                        isObscure: controller.isShowNewPassword,
                        icon: const Icon(Icons.lock_outlined),
                        focusedIcon: Icon(controller.isShowNewPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onTapIcon: () {
                          controller.showNewPassword();
                        },
                        controller: controller.newPassword,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Confirm Password Field
                    GetBuilder<ResetPasswordControllerImp>(
                      builder: (controller) => CustomTextField(
                        valid: (val) {
                          return validInput(val!, 5, 40, 'password');
                        },
                        labelText: 'Confirm Password',
                        isObscure: controller.isShowConfirmPassword,
                        icon: const Icon(Icons.lock_outlined),
                        focusedIcon: Icon(controller.isShowConfirmPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onTapIcon: () {
                          controller.showConfirmPassword();
                        },
                        controller: controller.confirmPassword,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Save Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.27),
                      child: CustomOnBoardingButton(
                        text: 'Save',
                        onPressed: () {
                          controller.save();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
