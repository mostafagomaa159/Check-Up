
import 'package:checkup/Core/Class/crud.dart';
import 'package:checkup/linkApi.dart';
class VerifyResetPassword {
  Crud crud;
  VerifyResetPassword(this.crud);
  postdata(String email,String otp) async {
    var response = await crud.postData(AppLink.validate_otp, {
      "email" : email ,
      "otp" : otp ,

    });
    return response.fold((l) => l, (r) => r);
  }
}