
import 'package:checkup/Core/Class/statusrequest.dart';
import 'package:checkup/Core/Constant/routes.dart';
import 'package:checkup/Core/Function/handlingdatacontroller.dart';
import 'package:get/get.dart';

import '../../Data/DataSource/Remote/Auth/verifycodesignup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verificationCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifyCodeSignUpData =VerifyCodeSignUpData(Get.find());
  String? email ;
  String? username ;
  String? password ;
  String? phone;
  StatusRequest statusRequest = StatusRequest.none ;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postdata(username!,email!,password!,phone!, verfiyCodeSignUp);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
        Get.offNamed(AppRoutes.successSignUp);
    }
    update();
  }

  @override
  void onInit() {
    email =Get.arguments['email'];
    username =Get.arguments['name'];
    password =Get.arguments['password'];
    phone =Get.arguments['phone_number'];
    super.onInit();
  }


}