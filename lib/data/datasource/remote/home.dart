import 'package:delivery/core/constant/link_api.dart';
import '../../../core/class/crud.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData() async{
    var response =await crud.postData(AppLinks.home, {});
    return response.fold((l) => l , (r) => r);
  }
}