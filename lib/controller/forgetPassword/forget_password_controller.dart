import 'package:delivery/routes_name.dart';
import 'package:delivery/data/datasource/remote/forgetPassword/forgetPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../core/class/status_request.dart';
import '../../../core/functions/handling_data_controller.dart';
import '../../data/model/user_model.dart';
import '../../view/widgets/auth/custom_error_dialog.dart';

abstract class ForgetPasswordController extends GetxController {
  void forgetPassword();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  StatusRequest? statusRequest = StatusRequest.none;
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late UserModel? user;
  late Box<UserModel> userBox;

  @override
  void forgetPassword() async {
    if (formState.currentState!.validate()) {
      if(email.text == user!.email){
        Get.offNamed(AppRoutes.verifyCode);
      }else {
        Get.dialog(
          CustomErrorDialog(
            text: "Email is not correct, please try again OR\n make Sign Up",
            button: ErrorButton(buttonText: "Sign Up",onPressed: ()=> Get.offNamed(AppRoutes.signup),),
          ),
        );
      }
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    userBox = Hive.box<UserModel>('userBox');
    user = userBox.get('currentUser');
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
