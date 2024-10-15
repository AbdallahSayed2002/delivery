import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/model/user_model.dart';
import 'dart:convert';

abstract class MyAccountController extends GetxController {}

class MyAccountControllerImp extends MyAccountController {
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  UserModel? user;
  late Box<UserModel> userBox;
  var isEditMode = false.obs;  // RxBool for reactive UI
  var userImage = ''.obs;      // Reactive field for profile image
  var image = Rxn<Uint8List>(); // Reactive image
  final ImagePicker _imagePicker = ImagePicker();  // Reactive nullable Uint8List for image data

  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    initializeUserBox();
    loadUserData();
  }

  Future<void> initializeUserBox() async {
    if (!Hive.isBoxOpen('userBox')) {
      await Hive.openBox<UserModel>('userBox');
    }
    userBox = Hive.box<UserModel>('userBox');
  }

  void loadUserData() {
    user = userBox.get('currentUser');
    if (user != null) {
      userNameController.text = user?.name ?? '';
      emailController.text = user?.email ?? '';
      phoneController.text = user?.phone ?? '';
      userImage.value = user?.image ?? '';
    }
  }

  void toggleEditMode() {
    isEditMode.value = !isEditMode.value;  // Toggle between edit/view modes
  }

  void saveUserData() {
    // Update user model
    user = UserModel(
      name: userNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      image: userImage.value,
    );

    // Save updated user to Hive
    userBox.put('currentUser', user!);

    // Exit edit mode
    isEditMode.value = false;
  }

  Future<void> selectImage(BuildContext context) async {
    // Show CupertinoActionSheet for selecting the image source
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Select Image Source', style: TextStyle(color: Colors.black54)),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Take Photo', style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.w600)),
            onPressed: () async {
              Get.back(); // Close the action sheet
              await _pickAndSetImage(ImageSource.camera); // Pick image from camera
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Choose from Gallery', style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.w600)),
            onPressed: () async {
              Get.back(); // Close the action sheet
              await _pickAndSetImage(ImageSource.gallery); // Pick image from gallery
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          child: const Text('Cancel',style: TextStyle(color: Colors.redAccent)),
          onPressed: () {
            Get.back(); // Close the action sheet
          },
        ),
      ),
    );
  }

  Future<void> _pickAndSetImage(ImageSource source) async {
    try {
      XFile? pickedFile = await _imagePicker.pickImage(source: source);
      if (pickedFile != null) {
        Uint8List imgBytes = await pickedFile.readAsBytes();
        image.value = imgBytes; // Update reactive image

        // Convert to base64 and store as string
        String base64Image = base64Encode(imgBytes);
        userImage.value = base64Image; // Update user image observable with base64 string
      } else {
        if (kDebugMode) {
          print("No Image Selected");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error picking image: $e");
      }
    }
  }


  @override
  void dispose() {
    // Dispose controllers
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
