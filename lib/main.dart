import 'package:delivery/binding/initial_binding.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/change_local.dart';
import 'core/localization/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices(); // تهيئة الخدمات مثل sharedPreferences
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام LocalController لإدارة اللغة والثيم
    LocalController controller = Get.put(LocalController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.language, // اللغة الحالية
      translations: MyTranslation(), // الترجمة
      title: 'delivery',

      // إعدادات الثيمات بناءً على اللغة والوضع النهاري/الليلي
      theme: controller.appTheme, // الثيم النهاري
      darkTheme: controller.appThemeDark, // الثيم الليلي
      themeMode: controller.themeMode, // وضع الثيم (system/light/dark)

      initialBinding: InitialBindings(), // الربط الأولي
      getPages: routes, // إعدادات الصفحات والتنقلات
    );
  }
}
