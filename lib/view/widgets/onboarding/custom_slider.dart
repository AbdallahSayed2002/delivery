import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controlling.dart';
import '../../../data/datasource/static/static.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => PageView.builder(
        controller: controller.pageController,
        itemCount: onBoardingList.length,
        onPageChanged: (index) => controller.onPageChanged(index),
        itemBuilder: (context, index) {
          return Transform(
            transform: Matrix4.identity()..translate(0.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    onBoardingList[index].image1!,
                    width: double.infinity,
                    scale: 0.5,
                    fit: BoxFit.fill,
                  ),
                ),
                Image.asset(
                  onBoardingList[index].image2!,
                  height: Get.width / 1.3,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  onBoardingList[index].title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  onBoardingList[index].text!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
