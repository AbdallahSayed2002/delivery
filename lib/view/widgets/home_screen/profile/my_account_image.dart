import 'package:delivery/controller/home/profile/my_account_controller.dart';
import 'package:delivery/core/constant/const_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/colors.dart';
import '../items/item_details/rounded_icon_btn.dart';

class MyAccountImage extends StatelessWidget {
  const MyAccountImage({super.key});

  @override
  Widget build(BuildContext context) {
    MyAccountControllerImp controller = Get.put(MyAccountControllerImp());
    return GestureDetector(
      onTap: ()=> controller.selectImage(context), // Trigger image picker
      child: SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Obx(() => controller.image.value != null
                ? CircleAvatar(
                    backgroundColor: controller.user?.image != null
                        ? Colors.lightBlue[300]
                        : Colors.transparent,
                    child: SizedBox(
                      height: 115,
                      width: 115,
                      child: ClipOval(
                        child: Image.memory(
                          controller.image.value!,
                          fit: BoxFit.cover, // Ensures image fills the avatar
                        ),
                      ),
                    ),
                  )
                : CircleAvatar(
                    child: Image.asset(
                      AppImageAssets.loginImage,
                      height: 115,
                    ),
                  )),
            Positioned(
              right: -15,
              bottom: -15,
              child: RoundedIconBtn(
                icon: Icon(CupertinoIcons.camera,color: Colors.grey[700],),
                size: 50,
                onPressed: () => controller.selectImage,
                color: AppColor.loginPageColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
