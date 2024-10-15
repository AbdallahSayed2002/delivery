import 'package:delivery/core/constant/link_api.dart';
import '../../../core/class/crud.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

  getData() async{
    var response =await crud.postData(AppLinks.test, {});
    return response.fold((l) => l , (r) => r);
  }
}