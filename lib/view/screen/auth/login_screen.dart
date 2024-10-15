import 'package:delivery/controller/auth/login_controller.dart';
import 'package:delivery/core/functions/valid_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/alert_exit_app.dart';
import '../../widgets/auth/custom_change_page_text.dart';
import '../../widgets/auth/custom_image.dart';
import '../../widgets/auth/custom_text_field.dart';
import '../../widgets/onboarding/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.loginPageColor,
      body: WillPopScope(
        onWillPop: () async {
          return await alertExitApp(); // Ensure the exit alert dialog is awaited
        },
        child: ListView(
          padding: EdgeInsets.all(screenWidth * 0.05),
          children: [
            const SizedBox(height: 100),
            const CustomImage(),
            const SizedBox(height: 8),
            Text(
              'Log in',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Wrap the TextFields with a Form to enable validation
            Form(
              key: controller.formState, // Associate the form key
              child: Column(
                children: [
                  // Email Input Field
                  CustomTextField(
                    valid: (val) => validInput(val!, 10, 50, 'email'),
                    labelText: 'Email',
                    icon: const Icon(Icons.email_outlined),
                    focusedIcon: const Icon(Icons.email_outlined),
                    controller: controller.emailController,
                  ),
                  const SizedBox(height: 20),

                  // Password Input Field
                  CustomTextField(
                    valid: (val) => validInput(val!, 5, 40, 'password'),
                    labelText: 'Password',
                    isObscure: controller.isShowPassword,
                    icon: const Icon(Icons.lock_outlined),
                    focusedIcon: Icon(controller.isShowPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    controller: controller.passwordController,
                  ),
                  const SizedBox(height: 12),

                  // Forget Password Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.goForgetPassword();
                        },
                        child: const Text(
                          'Forget Password  ',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Login Button
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.27),
                    child: CustomOnBoardingButton(
                      text: 'Log in',
                      onPressed: () {
                        controller.login(); // Trigger login
                      },
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Sign Up Navigation
                  CustomChangePageText(
                    text1: 'Don\'t have an account?',
                    text2: ' Sign up',
                    onTap: () {
                      controller.goSignUp();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
