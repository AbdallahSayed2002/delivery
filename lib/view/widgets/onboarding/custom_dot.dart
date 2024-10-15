import 'package:delivery/controller/onboarding_controlling.dart';
import 'package:delivery/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';

class CustomDot extends StatelessWidget {
  //Change ==> OnBoardingControllerImp, onBoardingList.length,
  //copy ==> pageController, currentPage
  const CustomDot({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onBoardingList.length,
              (index) => GestureDetector(
            onTap: () {
              controller.pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              controller.onPageChanged(index);
            },
            child: AnimatedScale(
              scale: controller.currentPage == index ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 300),
              child: AnimatedContainer(
                margin: const EdgeInsets.only(right: 8),
                width: controller.currentPage == index ? 15 : 8,
                height: controller.currentPage == index ? 15 : 8,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: controller.currentPage == index
                      ? AppColor.primaryColor
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}