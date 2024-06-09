

import 'package:checkup/Core/Services/SharedPre.dart';
import 'package:get/get.dart';

import '../Core/Class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
     SharedPrefrenceHelper.init();
    Get.put(Crud()) ;
  }
}