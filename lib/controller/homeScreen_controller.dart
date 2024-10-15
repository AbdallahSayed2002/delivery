import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/screen/home/favorite.dart';
import '../view/screen/home/home.dart';
import '../view/screen/home/profile/profile.dart';
import '../view/screen/home/cart.dart';

abstract class HomeScreenController extends GetxController {
  void changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  var currentPage = 0.obs;

  List<Widget> listPage = [
    const Home(),
    const Favorite(),
    const Cart(),
    const Profile(),
  ];

  @override
  void changePage(int page) {
    currentPage.value = page;
  }
}
