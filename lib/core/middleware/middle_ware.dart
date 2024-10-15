import 'package:delivery/routes_name.dart';
import 'package:delivery/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
  // int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: AppRoutes.welcome);
    }
    if (myServices.sharedPreferences.getString('step') == '2') {
      return const RouteSettings(name: AppRoutes.splashScreen);
    }
    return null;
  }
}