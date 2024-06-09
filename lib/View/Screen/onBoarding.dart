
import 'package:checkup/Controller/Controller_onBoarding.dart';
import 'package:checkup/Core/Constant/Color.dart';
import 'package:checkup/Core/Localization/ChangeLocal.dart';
import 'package:checkup/View/Widget/onBoarding/CustomBtn.dart';
import 'package:checkup/View/Widget/onBoarding/CustomSlideronBoarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/onBoarding/CustomDotsOnBoarding.dart';

class onBoarding extends StatelessWidget {
   onBoarding({super.key});
  LocaleController controller = Get.put(LocaleController());
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    print(controller.language);
    return const Scaffold(
      backgroundColor: AppColor.white,
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 3,
          child: CustomSlideronBoarding(),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomDotonBoarding(),
              Spacer(flex: 2),
              CustomBtnonBoarding(),
            ],
          ),
        ),
      ],
    )));
  }
}
