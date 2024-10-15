import 'package:delivery/core/constant/link_api.dart';
import '../../../../../core/class/crud.dart';

class VerifycodeData {
  Crud crud;

  VerifycodeData(this.crud);
  postData(String verifycode ,String email) async {
    var response = await crud.postData(AppLinks.verifycodeForget, {
      "verifycode" :  verifycode,
      "email"    :  email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
