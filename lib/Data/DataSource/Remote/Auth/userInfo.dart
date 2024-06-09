
import 'package:checkup/Core/Class/crud.dart';
import 'package:checkup/linkApi.dart';

class UserInfoData {
  Crud crud;
  UserInfoData(this.crud);
  getData(String token) async {
    var response = await crud.getData(AppLink.getUserInfo, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
}
