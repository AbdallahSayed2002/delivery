import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {

    'ar' : {
      '1' : 'اختر اللغه',
      '2' : 'مرحبا بكم في التطبيق',
      '3' : 'اكتشفنا',
    },

    'en' : {
      '1' : 'Choose Language',
      '2' : 'welcome to app',
      '3' : 'Explore Us',
    }
  };
}