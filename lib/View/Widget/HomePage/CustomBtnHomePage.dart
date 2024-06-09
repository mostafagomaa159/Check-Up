
import 'package:checkup/Controller/auth/login_controller.dart';
import 'package:checkup/Core/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Controller_onBoarding.dart';

class CustomBtnHomePage extends GetView<OnBoardingControllerImp> {
   CustomBtnHomePage({super.key});
  String token = Get.arguments['token'];
   LoginControllerImp loginControllerImp=LoginControllerImp();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40,left: 60,right: 60),
      child: MaterialButton(
        onPressed: () {


        },
        padding: const EdgeInsets.symmetric(horizontal: 100),
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: const Text("Start"),
      ),
    );
  }
}
