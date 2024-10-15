import 'package:delivery/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../data/model/user_model.dart';

abstract class ProfileController extends GetxController {

}

class ProfileControllerImp extends ProfileController {
  late UserModel? user;
  late Box<UserModel> userBox;

  @override
  void onInit() {
    userBox = Hive.box<UserModel>('userBox');
    user = userBox.get('currentUser');
    super.onInit();
  }

  void goToMyAccount() {
    Get.toNamed(AppRoutes.myAccount);
  }

  void goToNotification() {
    Get.toNamed(AppRoutes.notification);
  }

  void goToSetting() {
    Get.toNamed(AppRoutes.setting);
  }

  void goToHelpCenter() {
    Get.toNamed(AppRoutes.helpCenter);
  }

  void logOut() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      textCancel: 'Cancel',
      textConfirm: 'Logout',
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back(); // Close the dialog
        // Add your logout logic here
        Get.offAllNamed(AppRoutes.welcome); // Example: Redirect to login page
      },
    );
  }

}