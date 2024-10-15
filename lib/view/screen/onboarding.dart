import 'package:delivery/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/onboarding_controlling.dart';
import '../widgets/onboarding/custom_button.dart';
import '../widgets/onboarding/custom_button_skip.dart';
import '../widgets/onboarding/custom_dot.dart';
import '../widgets/onboarding/custom_slider.dart';

class OnBoarding extends GetView<OnBoardingControllerImp> {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(
            flex: 5,
            child: CustomSlider(),
          ),
          SizedBox(height: screenHeight * 0.02), // Example of using percentage-based spacing
          const CustomDot(),
          SizedBox(height: screenHeight * 0.02), // Example of using percentage-based spacing
          CustomOnBoardingButton(
            text: 'Continue',
            onPressed: () {
              controller.next();
            },
          ),
          SizedBox(height: screenHeight * 0.005), // Example of using percentage-based spacing
          CustomButtonSkip(
            text: 'Skip',
            onTap: () {
              Get.offNamed(AppRoutes.welcome);
            },
          ),
          const SizedBox(height: 20), // Example of adding fixed height
        ],
      ),
    );
  }
}
