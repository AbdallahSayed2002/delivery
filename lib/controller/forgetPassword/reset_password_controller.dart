import 'package:delivery/routes_name.dart';
import 'package:delivery/view/widgets/auth/custom_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  void save();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController newPassword;
  late TextEditingController confirmPassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isShowNewPassword = true;
  bool isShowConfirmPassword = true;

  // Toggle visibility of new password
  showNewPassword() {
    isShowNewPassword = !isShowNewPassword;
    update();
  }

  // Toggle visibility of confirm password
  showConfirmPassword() {
    isShowConfirmPassword = !isShowConfirmPassword;
    update();
  }
  

  @override
  void save() async {
    // Validate form first
    if (!formState.currentState!.validate()) {
      return;
    }

    // Check if new password matches the confirm password
    if (newPassword.text != confirmPassword.text) {
      Get.dialog(
        const CustomErrorDialog(text: "Passwords do not match")
      );
    } else {
      // Save successfully
      Get.dialog(
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/done.png',
                height: 250,
              ),
              const SizedBox(height: 20),
              Text(
                "Saved successfully",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.green[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // Navigate back to settings after saving
        arguments: Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed(AppRoutes.login);
        }),
      );
      Get.delete();
    }
  }

  @override
  void onInit() {
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
