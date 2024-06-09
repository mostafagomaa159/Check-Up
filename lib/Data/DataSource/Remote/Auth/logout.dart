
import 'package:checkup/Core/Class/crud.dart';
import 'package:checkup/linkApi.dart';

class logOutData {
  Crud crud;
  logOutData(this.crud);
  postdata( String token) async {
    var response = await crud.postData(AppLink.logout, {
      "token" : token ,
    });
    return response.fold((l) => l, (r) => r);
  }
}