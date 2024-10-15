import 'package:delivery/core/constant/link_api.dart';
import '../../../../../core/class/crud.dart';

class ResetPasswordData {
  Crud crud;

  ResetPasswordData(this.crud);
  postData(String password ,String email) async {
    var response = await crud.postData(AppLinks.resetPassword, {
      "password" :  password,
      "email"    :  email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
