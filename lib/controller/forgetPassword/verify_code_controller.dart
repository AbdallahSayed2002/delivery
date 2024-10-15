import 'package:delivery/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../data/model/user_model.dart';
import '../../view/widgets/auth/custom_error_dialog.dart';
import '../../view/widgets/auth/custom_true_dialog.dart';

abstract class VerifyCodeController extends GetxController {
  void checkCode(String enteredCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late UserModel? user;
  late Box<UserModel> userBox;
  bool shouldSendVerifyCode = false;

  @override
  void onInit() {
    super.onInit();
    userBox = Hive.box<UserModel>('userBox');
    user = userBox.get('currentUser');
    sendVerifyCode();
  }

  @override
  void checkCode(String enteredCode) async {
    if (enteredCode == user!.verifyCode) {
      Get.dialog(
        CustomTrueDialog(
          text: "Code verified successfully",
          buttonText: 'Reset Password',
          onPressed: () async {
            shouldSendVerifyCode = false;
            Get.offAllNamed(AppRoutes.resetPassword); // Navigate to login page
            Get.delete();
          },
        ),
      );
    } else {
      Get.dialog(
        const CustomErrorDialog(
          text: "Incorrect verification code. Please try again.",
        ),
      );
    }
  }

  void sendVerifyCode() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar(
        'Verification Code',
        'Your verification code is: ${user!.verifyCode}',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.blueAccent,
        colorText: Colors.white,
      );
    });
  }
}