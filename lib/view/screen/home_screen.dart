import 'package:delivery/core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../controller/homeScreen_controller.dart';
import '../../core/functions/alert_exit_app.dart';

class HomeScreen extends StatelessWidget {
  final int? page;

  const HomeScreen({super.key, this.page});

  @override
  Widget build(BuildContext context) {
    // Ensure the controller is initialized
    final controller = Get.put(HomeScreenControllerImp());

    // Set the initial page based on the passed "page" value
    if (page != null) {
      controller.currentPage.value = page!;
    }

    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) =>


        Scaffold(
          backgroundColor: AppColor.loginPageColor,
          bottomNavigationBar: Obx(
            () => Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  ),
                ],
              ),
              child: SafeArea(
                child: GNav(
                  gap: 8,
                  backgroundColor: Colors.white,
                  color: Colors.black,
                  activeColor: Colors.blue,
                  tabBackgroundColor: Colors.grey.shade200,
                  padding: const EdgeInsets.all(22),
                  selectedIndex: controller.currentPage.value,
                  // Set selected page
                  onTabChange: (index) {
                    controller.changePage(index);
                  },
                  tabs: const [
                    GButton(
                      icon: Icons.home_rounded,
                      text: "Home",
                    ),
                    GButton(
                      icon: Icons.favorite,
                      text: "Favorite",
                    ),
                    GButton(
                      icon: CupertinoIcons.cart_fill,
                      text: "Cart",
                    ),
                    GButton(
                      icon: CupertinoIcons.person_fill,
                      text: "Profile",
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: WillPopScope(
            onWillPop: () async {
              return await alertExitApp();
            },
            child: Obx(
              () => Center(
                child:
                    controller.listPage.elementAt(controller.currentPage.value),
              ),
            ),
          ),
        )
    );
  }
}
