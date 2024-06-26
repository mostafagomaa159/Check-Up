
import 'package:checkup/Core/Class/statusrequest.dart';
import 'package:checkup/Core/Constant/routes.dart';
import 'package:checkup/Core/Function/handlingdatacontroller.dart';
import 'package:checkup/Data/DataSource/Remote/Auth/VerifyResetPassword.dart';
import 'package:get/get.dart';



abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verificationCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  late String verifycode;
  StatusRequest? statusRequest;
  VerifyResetPassword verifyresetpassword = VerifyResetPassword(Get.find());

  @override
  checkCode() {}

  @override
  goToResetPassword(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyresetpassword.postdata(email!, verificationCode);
    print("!!!=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.offNamed(AppRoutes.resetPassword, arguments: {
        "otp": verificationCode,
        "email": email,

      });
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
