import 'package:delivery/routes_name.dart';
import 'package:delivery/data/datasource/remote/auth/checkEmail.dart';
import 'package:delivery/view/widgets/auth/custom_error_dialog.dart';
import 'package:delivery/view/widgets/auth/custom_true_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../data/model/user_model.dart';

abstract class CheckEmailController extends GetxController {
  void checkEmail(String enteredCode);
}

class CheckEmailControllerImp extends CheckEmailController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
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
  void checkEmail(String enteredCode) async {
    if (enteredCode == user!.verifyCode) {
      Get.dialog(
        CustomTrueDialog(
          text: "Code verified successfully",
          buttonText: 'Login',
          onPressed: () async {
              user!.provide = "1"; // Update the user's verification status
              await userBox.put('currentUser', user!); // Save updated user object
              shouldSendVerifyCode = false;
              Get.offAllNamed(AppRoutes.login); // Navigate to login page
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
