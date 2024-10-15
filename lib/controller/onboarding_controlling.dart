import 'package:delivery/routes_name.dart';
import 'package:delivery/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:delivery/data/datasource/static/static.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  void next();
  void onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  late int currentPage = 0;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    pageController = PageController(initialPage: currentPage);
    pageController.addListener(() {
      int newPage = pageController.page!.round();
      if (newPage != currentPage) {
        onPageChanged(newPage);
      }
    });
    super.onInit();
  }

  @override
  void next() {
    if (currentPage == onBoardingList.length-1) {
      myServices.sharedPreferences.setString('step', '1');
      Get.offAllNamed(AppRoutes.welcome);
    } else {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      update();
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  skip() {
    myServices.sharedPreferences.setString('step', '1');
    Get.offAllNamed(AppRoutes.welcome);
  }
}
