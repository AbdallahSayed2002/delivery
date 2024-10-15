import 'package:delivery/controller/auth/signup_controller.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/alert_exit_app.dart';
import '../../../core/functions/valid_input.dart';
import '../../widgets/auth/custom_change_page_text.dart';
import '../../widgets/auth/custom_image.dart';
import '../../widgets/auth/custom_text_field.dart';
import '../../widgets/onboarding/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final SignUpControllerImp controller = Get.put(SignUpControllerImp());

    return Scaffold(
      backgroundColor: AppColor.loginPageColor,
      body: WillPopScope(
        onWillPop: () => alertExitApp(),
        child: ListView(
          padding: EdgeInsets.all(screenWidth * 0.005),
          children: [
            _buildSignUpForm(context, controller, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpForm(BuildContext context, SignUpControllerImp controller,
      double screenWidth) {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 100),
          const CustomImage(),
          const SizedBox(height: 8),
          _buildSignUpTitle(context),
          const SizedBox(height: 30),
          _buildUserNameField(controller),
          const SizedBox(height: 20),
          _buildPasswordField(controller),
          const SizedBox(height: 20),
          _buildEmailField(controller),
          const SizedBox(height: 20),
          _buildPhoneField(controller),
          const SizedBox(height: 32),
          _buildSignUpButton(controller, screenWidth),
          const SizedBox(height: 12),
          _buildChangePageText(controller),
        ],
      ),
    );
  }

  Widget _buildSignUpTitle(BuildContext context) {
    return Text(
      'Sign up',
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildUserNameField(SignUpControllerImp controller) {
    return CustomTextField(
      valid: (val) => validInput(val!, 3, 20, 'username'),
      labelText: 'User Name',
      icon: const Icon(Icons.person_outlined),
      focusedIcon: const Icon(Icons.person_outlined),
      controller: controller.userNameController,
    );
  }

  Widget _buildPasswordField(SignUpControllerImp controller) {
    return GetBuilder<SignUpControllerImp>(
      builder: (_) => CustomTextField(
        valid: (val) => validInput(val!, 5, 40, 'password'),
        labelText: 'Password',
        isObscure: controller.isPasswordVisible,
        icon: const Icon(Icons.lock_outlined),
        focusedIcon: Icon(controller.isPasswordVisible
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined),
        onTapIcon: () => controller.togglePasswordVisibility(),
        controller: controller.passwordController,
      ),
    );
  }

  Widget _buildEmailField(SignUpControllerImp controller) {
    return CustomTextField(
      valid: (val) => validInput(val!, 10, 50, 'email'),
      labelText: 'Email',
      icon: const Icon(Icons.email_outlined),
      focusedIcon: const Icon(Icons.email_outlined),
      controller: controller.emailController,
    );
  }
  Widget _buildPhoneField(SignUpControllerImp controller) {
    return CustomTextField(
      valid: (val) => validInput(val!, 3, 12, 'phoneNumber'),
      labelText: 'Phone Number',
      icon: const Icon(Icons.phone_outlined),
      focusedIcon: const Icon(Icons.phone_outlined),
      controller: controller.phoneController,
    );
  }

  Widget _buildSignUpButton(
      SignUpControllerImp controller, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.27),
      child: CustomOnBoardingButton(
        text: 'Sign up',
        onPressed: () => controller.signUp(),
      ),
    );
  }

  Widget _buildChangePageText(SignUpControllerImp controller) {
    return CustomChangePageText(
      text1: 'Already have an account?',
      text2: ' Log in',
      onTap: () => controller.goLogin(),
    );
  }
}
