import 'package:delivery/view/widgets/onboarding/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../controller/auth/check_email_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/alert_exit_app.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the CheckEmailControllerImp instance
    final CheckEmailControllerImp controller =
        Get.put(CheckEmailControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;

    // Call `sendVerifyCode()` on page load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.sendVerifyCode();
    });

    return Scaffold(
      backgroundColor: AppColor.loginPageColor,
      body: WillPopScope(
        onWillPop: () async {
          return await alertExitApp();
        },
        child: GetBuilder<CheckEmailControllerImp>(
          builder: (controller) => ListView(
            padding: EdgeInsets.all(screenWidth * 0.05),
            children: [
              const SizedBox(height: 80),
              Text(
                'Check Email',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                controller.user?.email ?? "No email found",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.01),
                child: OtpTextField(
                  fieldWidth: screenWidth * 0.12,
                  fieldHeight: screenWidth * 0.18,
                  borderRadius: BorderRadius.circular(18.0),
                  numberOfFields: 5,
                  borderColor: AppColor.primaryColor,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    // You can handle any dynamic changes here, but no action needed
                  },
                  onSubmit: (String enteredCode) {
                    print("Entered Code: $enteredCode");
                    controller
                        .checkEmail(enteredCode); // Trigger email verification
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.27,
                    vertical: screenWidth * 0.06),
                child: CustomOnBoardingButton(
                  onPressed: () {
                    controller.sendVerifyCode(); // Resend verification code
                  },
                  text: "ReSend",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
