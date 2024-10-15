import 'package:delivery/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';
import '../../../core/localization/change_local.dart';
import '../../widgets/language/custom_language_button.dart';

class LanguagePage extends GetView<LocalController> {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.loginPageColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      '1'.tr,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    CustomLanguageButton(
                      onTap: () {
                        Get.toNamed(AppRoutes.onboarding);
                        controller.changeLang('ar');
                      },
                      text: 'ar',
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    CustomLanguageButton(
                      onTap: () {
                        Get.offNamed(AppRoutes.onboarding);
                        controller.changeLang('en');
                      },
                      text: 'en',
                      color: Colors.blue[800],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
