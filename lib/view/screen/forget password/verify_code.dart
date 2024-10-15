import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetPassword/verify_code_controller.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/functions/alert_exit_app.dart';
import '../../widgets/onboarding/custom_button.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
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
        child: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) => ListView(
            padding: EdgeInsets.all(screenWidth * 0.05),
            children: [
              const SizedBox(height: 80),
              Text(
                'Verify Code',
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
                        .checkCode(enteredCode); // Trigger email verification
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
