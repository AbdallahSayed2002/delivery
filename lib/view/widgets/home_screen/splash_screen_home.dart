import 'package:delivery/controller/home/splash_screen_home_controller.dart';
import 'package:delivery/core/constant/const_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenHome extends StatelessWidget {
  const SplashScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenHomeControllerImp());
    return Scaffold(
      backgroundColor: const Color(0xfffffcf7),
      body: Center(
        child: Image.asset(
          AppImageAssets.splashScreenImage,
          height: 200,
        ),
      ),
    );
  }
}

