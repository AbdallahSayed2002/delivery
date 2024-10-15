import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:delivery/routes_name.dart';
import 'package:delivery/view/widgets/auth/custom_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../core/services/services.dart';
import '../../data/model/user_model.dart';

abstract class LoginController extends GetxController {
  void login();
  void goSignUp();
  void goForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  MyServices myServices = Get.find();
  late UserModel? user;
  late Box<UserModel> userBox;
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isShowPassword = true;

  @override
  void onInit() {
    userBox = Hive.box<UserModel>('userBox');
    user = userBox.get('currentUser');

    if (user == null) {
      // Handle the case where the user is not found
      Get.dialog(
        const CustomErrorDialog(text: "Error No user found. Please sign up.")
      );
    }

    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void showPassword() {
    isShowPassword = !isShowPassword;
    update(); // Update UI to reflect password visibility change
  }

  String _hashPassword(String password) {
    var bytes = utf8.encode(password); // Convert password to bytes
    var digest = sha256.convert(bytes); // Hash with SHA-256
    return digest.toString();
  }

  @override
  void login() async {
    print(user!.email);
    print(user!.password);
    // Check if form is valid
    String enteredHashedPassword = _hashPassword(passwordController.text);
    if (formState.currentState != null && formState.currentState!.validate()) {
      try {
        if (user != null && user!.password == enteredHashedPassword && user!.email == emailController.text && user!.provide == "1") {
          myServices.sharedPreferences.setString("step", "2");
          Get.offAllNamed(AppRoutes.home); // Navigate to home if login is successful
        } else {
          Get.dialog(
              const CustomErrorDialog(text: "Email or Password isn't correct")
          );
        }
      } catch (e) {
        Get.dialog(
            CustomErrorDialog(text: "Error ${e.toString()}")
        );
      }
    } else {
      // If validation fails, prompt the user
      Get.dialog(
          const CustomErrorDialog(text: "Please enter valid credentials.")
      );
    }
  }


  @override
  void goSignUp() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  void goForgetPassword() {
    Get.offNamed(AppRoutes.forgetPassword);
  }
}
