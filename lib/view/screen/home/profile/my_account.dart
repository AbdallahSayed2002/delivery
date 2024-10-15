import 'package:delivery/view/widgets/home_screen/profile/my_account_image.dart';
import 'package:delivery/view/widgets/home_screen/profile/my_account_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/controller/home/profile/my_account_controller.dart';
import 'package:delivery/view/widgets/home_screen/items/item_details/rounded_icon_btn.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/functions/valid_input.dart';
import '../../../../routes_name.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final MyAccountControllerImp controller = Get.put(MyAccountControllerImp());

    return Scaffold(
      floatingActionButton: Obx(() => controller.isEditMode.value
          ? RoundedIconBtn(
              onPressed: controller.saveUserData,
              icon: const Icon(Icons.save, color: Colors.white, size: 35),
              color: Colors.green[300],
              size: 70,
            )
          : RoundedIconBtn(
              onPressed: controller.toggleEditMode,
              icon: const Icon(Icons.edit, color: Colors.white, size: 35),
              color: Colors.lightBlue[300],
              size: 70,
            )),
      backgroundColor: AppColor.loginPageColor,
      appBar: AppBar(
        title: const SafeArea(child: Text('My Account')),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          Column(
            children: [
              const MyAccountImage(),
              const SizedBox(height: 20),
              Obx(
                () => MyAccountMenu(
                  text: controller.isEditMode.value
                      ? TextFormField(
                          cursorColor: Colors.blue,
                          validator: (val) => validInput(val!, 3, 20, 'name'),
                          controller: controller.userNameController,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: "sana",
                          ),
                          decoration: InputDecoration(
                            label: const Text("First Name"),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontFamily: "sana",
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              // Bottom border when focused
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              // Bottom border when not focused
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                        )
                      : Text(
                          controller.user?.name ?? "User",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: "sana",
                          ),
                        ), // Pass Text widget
                  color: Colors.white,
                  iconColor: Colors.lightBlue[300],
                  icon: CupertinoIcons.person_fill,
                ),
              ),
              Obx(
                () => MyAccountMenu(
                  text: controller.isEditMode.value
                      ? TextFormField(
                          cursorColor: Colors.blue,
                          validator: (val) => validInput(val!, 10, 50, 'email'),
                          controller: controller.emailController,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: "sana",
                          ),
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              // Bottom border when focused
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              // Bottom border when not focused
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                            label: const Text("Email"),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontFamily: "sana",
                            ),
                          ),
                        )
                      : Text(
                          controller.user?.email ?? "user@gmail.com",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: "sana",
                          ),
                        ),
                  // Pass Text widget
                  color: Colors.white,
                  iconColor: Colors.lightBlue[300],
                  icon: Icons.email,
                ),
              ),
              Obx(
                () => MyAccountMenu(
                  text: controller.isEditMode.value
                      ? TextFormField(
                          validator: (val) => validInput(val!, 11, 11, 'phone'),
                          cursorColor: Colors.blue,
                          controller: controller.phoneController,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: "sana",
                          ),
                          decoration: InputDecoration(
                            label: const Text("Phone"),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontFamily: "sana",
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              // Bottom border when focused
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              // Bottom border when not focused
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                        )
                      : Text(
                          "+20 ${controller.user?.phone}",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: "sana",
                          ),
                        ),
                  // Pass Text widget
                  color: Colors.white,
                  iconColor: Colors.lightBlue[300],
                  icon: CupertinoIcons.phone_fill,
                ),
              ),
              Obx(
                () => MyAccountMenu(
                  text: Text(
                    controller.isEditMode.value
                        ? "Change password"
                        : "● ● ● ● ● ●",
                    style: TextStyle(
                      color: controller.isEditMode.value
                          ? Colors.blueAccent
                          : Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: "sana",
                    ),
                  ),
                  color: Colors.white,
                  iconColor: Colors.lightBlue[300],
                  icon: CupertinoIcons.lock_fill,
                  onPressed: () {
                    if (controller.isEditMode.value) {
                      Get.toNamed(AppRoutes.changePassword);
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
