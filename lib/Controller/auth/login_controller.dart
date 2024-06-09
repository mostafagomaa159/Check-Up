import 'package:checkup/Core/Class/statusrequest.dart';
import 'package:checkup/Core/Constant/routes.dart';
import 'package:checkup/Core/Function/handlingdatacontroller.dart';
import 'package:checkup/Core/Services/SharedPre.dart';
import 'package:checkup/Data/DataSource/Remote/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_controller.dart';

abstract class LoginController extends GetxController {
  login();
  token();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest? statusRequest;
  LoginData loginData = LoginData(Get.find());
  bool isShowPassword = true;
  Map data = {};
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      var response = await loginData.postdata(email.text, password.text);
      print("!!!=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        data.addAll(response['data']);
        String t = data['token'];
        print(t);
        SharedPrefrenceHelper.saveData(key: 't', value: t);
        Get.offNamed(AppRoutes.homepage, arguments: {
          "email": email.text,
          "password": password.text,
          "token": data["token"],
        });
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Email Or Password Not Correct");
        statusRequest = StatusRequest.failure;
        print("Not Valid");
      }
      update();
      Get.delete<SignUpControllerImp>();
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  token() {
    Get.offNamed(AppRoutes.QuestionView, arguments: {
      "token": data["token"],
    });
  }
}
