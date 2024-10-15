import 'package:delivery/controller/home/profile/profile_controller.dart';
import 'package:delivery/core/constant/const_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImage extends GetView<ProfileControllerImp> {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundColor: controller.user?.image != null ? Colors.lightBlue[300] : Colors.transparent,
            child: Image.asset(
              controller.user?.image ?? AppImageAssets.loginImage,
              height: 115,
            ),
          ),
        ],
      ),
    );
  }
}
