import 'package:delivery/core/constant/link_api.dart';
import '../../../../core/class/crud.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);
  postData(String email , String checkEmailCode) async {
    var response = await crud.postData(AppLinks.verifyCode, {
      "email"      :  email,
      "verifycode" :  checkEmailCode, 
    });
    return response.fold((l) => l, (r) => r);
  }
}
