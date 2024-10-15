import 'package:delivery/controller/forgetPassword/forget_password_controller.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/functions/valid_input.dart';
import '../../widgets/auth/custom_text_field.dart';
import '../../widgets/onboarding/custom_button.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Get.offNamed(AppRoutes.login);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 27,
          ),
        ),
      ),
      backgroundColor: AppColor.loginPageColor,
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth * 0.005),
                child: Form(
                  key: controller.formState,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Forget Password',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        valid: (val) {
                          return validInput(val!, 10, 50, 'email');
                        },
                        labelText: 'Email',
                        icon: const Icon(Icons.email_rounded),
                        focusedIcon: const Icon(Icons.email_rounded),
                        controller: controller.email,
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.27),
                        child: CustomOnBoardingButton(
                          text: 'Check',
                          onPressed: () => controller.forgetPassword()
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
