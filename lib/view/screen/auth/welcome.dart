import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/core/constant/const_image.dart';
import 'package:delivery/routes_name.dart';
import 'package:delivery/core/functions/alert_exit_app.dart';
import 'package:delivery/core/functions/check_internet.dart';
import 'package:delivery/view/widgets/onboarding/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/onboarding/custom_button_skip.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState()=> _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen>{
  var res;

  initDate() async {
    res = await CheckInternet();
    print(res);
  }

  @override
  void initState() {
    initDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.loginPageColor,
      body: WillPopScope(
        onWillPop: () {
          return alertExitApp();
        },
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 35),
                  Text(
                    '2'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '3'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 120),
                  SizedBox(
                    height: 260,
                    width: double.infinity,
                    child: Image.asset(
                      AppImageAssets.welcomeImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: CustomOnBoardingButton(
                      text: 'Log In',
                      onPressed: () {
                        Get.offNamed(AppRoutes.login);
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomButtonSkip(
                    text: 'Sign Up',
                    onTap: () {
                      Get.offNamed(AppRoutes.signup);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}