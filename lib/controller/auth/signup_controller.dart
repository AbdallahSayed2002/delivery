import 'dart:math';
import 'package:delivery/data/model/user_model.dart';
import 'package:delivery/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:crypto/crypto.dart'; // Add crypto for hashing
import 'dart:convert'; // For utf8.encode

abstract class SignUpController extends GetxController {
  void signUp();
  void goLogin();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;

  GlobalKey<FormState> get formKey => _formKey;
  Box<UserModel> userBox = Hive.box<UserModel>('userBox'); // Ensure Box<UserModel>
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  @override
  void onInit() {
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update(); // Calls GetX to rebuild UI with updated state
  }

  @override
  void signUp() async {
    if (_formKey.currentState!.validate()) {
      if (kDebugMode) {
        print("Validation passed, creating user...");
      }

      // Hash password before storing
      String hashedPassword = _hashPassword(passwordController.text);
      final random = Random();
      final randomPart = 10000 + random.nextInt(90000);

      // Create UserModel instance
      UserModel user = UserModel(
        name: userNameController.text,
        email: emailController.text,
        password: hashedPassword, // Store the hashed password
        phone: phoneController.text,
        id: _generateUniqueId().toString(),
        verifyCode: randomPart.toString(),
      );

      // Save UserModel to Hive box
      await Hive.box<UserModel>('userBox').put('currentUser', user);
      //await userBox.put(user.id, user);

      if (kDebugMode) {
        print("User saved with ID: ${user.id}");
      }

      // Navigate to check email page
      Get.offNamed(AppRoutes.checkEmail);
    }
    update();
  }

  @override
  void goLogin() {
    Get.offNamed(AppRoutes.login);
  }

  int _generateUniqueId() {
    final random = Random();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomPart = random.nextInt(10000);
    return timestamp + randomPart;
  }

  String _hashPassword(String password) {
    var bytes = utf8.encode(password); // Convert password to bytes
    var digest = sha256.convert(bytes); // Hash with SHA-256
    return digest.toString();
  }
}
