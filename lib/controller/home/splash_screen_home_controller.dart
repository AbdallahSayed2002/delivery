import 'package:delivery/routes_name.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

abstract class SplashScreenHomeController extends GetxController {}

class SplashScreenHomeControllerImp extends SplashScreenHomeController {
  @override
  void onInit() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.home);
    });
    super.onInit();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values
    );
    super.dispose();
  }
}
