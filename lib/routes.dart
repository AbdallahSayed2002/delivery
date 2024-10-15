import 'package:delivery/routes_name.dart';
import 'package:delivery/core/middleware/middle_ware.dart';
import 'package:delivery/view/screen/home/items/item_details.dart';
import 'package:delivery/view/screen/home/profile/help_center.dart';
import 'package:delivery/view/screen/home/profile/my_account.dart';
import 'package:delivery/view/screen/home/profile/notification.dart';
import 'package:delivery/view/screen/home/profile/setting.dart';
import 'package:delivery/view/screen/home_screen.dart';
import 'package:delivery/view/screen/home/items/items.dart';
import 'package:delivery/view/screen/auth/check_email.dart';
import 'package:delivery/view/screen/forget%20password/forget_password.dart';
import 'package:delivery/view/screen/auth/language.dart';
import 'package:delivery/view/screen/auth/login_screen.dart';
import 'package:delivery/view/screen/forget%20password/reset_password.dart';
import 'package:delivery/view/screen/auth/sign_up_screen.dart';
import 'package:delivery/view/screen/forget%20password/verify_code.dart';
import 'package:delivery/view/screen/auth/welcome.dart';
import 'package:delivery/view/screen/onboarding.dart';
import 'package:delivery/view/widgets/home_screen/splash_screen_home.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  //test
  //GetPage(name: '/', page: () => const WelcomeScreen()),
  // ======================================== auth =============================
  GetPage(name: '/', page: () => const LanguagePage(), middlewares: [MiddleWare()]),
  GetPage(name: AppRoutes.welcome, page: () => const WelcomeScreen()),
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.signup, page: () => const SignUpScreen()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.checkEmail, page: () => const CheckEmail()),
  GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreenHome()),
  //===================================== OnBoarding ===========================
  GetPage(name: AppRoutes.onboarding, page: () => const OnBoarding()),
  //==================================== home ==================================
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.items, page: () => const Items()),
  GetPage(name: AppRoutes.itemsDetails, page: () => const ItemDetails()),
  //================================== profile =================================
  GetPage(name: AppRoutes.myAccount, page: () => const MyAccount()),
  GetPage(name: AppRoutes.notification, page: () => const Notification()),
  GetPage(name: AppRoutes.setting, page: () => const Setting()),
  GetPage(name: AppRoutes.helpCenter, page: () => const HelpCenter()),
];