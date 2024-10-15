import 'package:delivery/core/constant/app_theme.dart';
import 'package:delivery/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeMode themeMode = ThemeMode.system; // Default to system theme mode
  ThemeData appTheme = themeEnglishLight; // Default to English light theme

  // تغيير اللغة وتحديث الثيم بناءً على اللغة والوضع (نهاري/ليلي)
  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString('lang', langCode);

    // تغيير الثيم بناءً على اللغة والوضع النهاري/الليلي
    if (langCode == 'en') {
      appTheme = Get.isDarkMode ? themeEnglishDark : themeEnglishLight;
    } else {
      appTheme = Get.isDarkMode ? themeArabicDark : themeArabicLight;
    }

    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  // تغيير الوضع النهاري/الليلي (أو اتباع النظام)
  void changeThemeMode(ThemeMode mode) {
    themeMode = mode;
    myServices.sharedPreferences.setString('themeMode', mode.toString());
    Get.changeThemeMode(mode);

    // تحديث الثيم بناءً على الوضع الحالي واللغة المختارة
    String? currentLang = myServices.sharedPreferences.getString('lang') ?? 'en';
    changeLang(currentLang);  // تحديث الثيم بعد تغيير الوضع
  }

  @override
  void onInit() {
    // تحميل اللغة المحفوظة في sharedPreferences
    String? sharedPreLang = myServices.sharedPreferences.getString('lang');
    String? savedThemeMode = myServices.sharedPreferences.getString('themeMode');

    // تعيين اللغة الافتراضية بناءً على الإعدادات المخزنة
    if (sharedPreLang == 'ar') {
      language = const Locale('ar');
      appTheme = Get.isDarkMode ? themeArabicDark : themeArabicLight;
    } else if (sharedPreLang == 'en') {
      language = const Locale('en');
      appTheme = Get.isDarkMode ? themeEnglishDark : themeEnglishLight;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglishLight;
    }

    // تعيين وضع الثيم (نهاري/ليلي)
    if (savedThemeMode == ThemeMode.dark.toString()) {
      themeMode = ThemeMode.dark;
    } else if (savedThemeMode == ThemeMode.light.toString()) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.system;
    }

    Get.changeThemeMode(themeMode);

    super.onInit();
  }
}
