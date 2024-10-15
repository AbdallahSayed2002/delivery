import 'package:delivery/controller/home/profile/profile_controller.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/home_screen/profile/profile_image.dart';
import '../../../widgets/home_screen/profile/profile_menu.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImp controller = Get.put(ProfileControllerImp());
    return Scaffold(
      backgroundColor: AppColor.loginPageColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const SafeArea(child: Center(child: Text("Profile"))),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          Column(
            children: [
              const ProfileImage(),
              const SizedBox(height: 20),
              ProfileMenu(
                text: "My Account",
                color: Colors.white,
                iconColor: Colors.blue,
                icon: CupertinoIcons.person,
                secondIconColor: const Color(0xFF757575),
                onPressed: controller.goToMyAccount,
              ),
              ProfileMenu(
                text: "Notifications",
                color: Colors.white,
                iconColor: Colors.blue,
                icon: CupertinoIcons.bell,
                secondIconColor: const Color(0xFF757575),
                onPressed: controller.goToNotification,
              ),
              ProfileMenu(
                text: "Settings",
                color: Colors.white,
                iconColor: Colors.blue,
                icon: CupertinoIcons.settings_solid,
                secondIconColor: const Color(0xFF757575),
                onPressed: controller.goToSetting,
              ),
              ProfileMenu(
                text: "Help Center",
                color: Colors.white,
                iconColor: Colors.blue,
                icon: Icons.help_outlined,
                secondIconColor: const Color(0xFF757575),
                onPressed: controller.goToHelpCenter,
              ),
              ProfileMenu(
                text: "Log Out",
                color: const Color(0xFFFFE6E6),
                iconColor: const Color(0xFFFF4848),
                icon: Icons.logout,
                secondIconColor: const Color(0xFFFF4848),
                onPressed: controller.logOut,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
