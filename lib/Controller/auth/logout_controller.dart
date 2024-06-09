
import 'package:checkup/Core/Class/statusrequest.dart';
import 'package:checkup/Core/Constant/routes.dart';
import 'package:checkup/Core/Function/handlingdatacontroller.dart';
import 'package:checkup/Core/Services/SharedPre.dart';
import 'package:checkup/Data/DataSource/Remote/Auth/logout.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'userInfo_controller.dart';

abstract class logOutController extends GetxController {
  logout();
}

class logOutControllerImp extends logOutController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest? statusRequest;
  logOutData logoutdata = logOutData(Get.find());
  // String? token;
  List data = [];
  @override
  logout() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await logoutdata.postdata(SharedPrefrenceHelper.getData(key: 't')!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.offNamed(AppRoutes.login);
      SharedPrefrenceHelper.removeData(key: 't');
      print(SharedPrefrenceHelper.getData(key: 't'));
    }
    update();
    Get.delete<UserInfoController>();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
