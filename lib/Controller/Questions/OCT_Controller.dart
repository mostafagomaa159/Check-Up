import 'dart:io';

import 'package:checkup/Controller/auth/userInfo_controller.dart';
import 'package:checkup/Core/Class/statusrequest.dart';
import 'package:checkup/Core/Constant/routes.dart';
import 'package:checkup/Core/Function/handlingdatacontroller.dart';
import 'package:checkup/Core/Services/SharedPre.dart';
import 'package:checkup/Data/DataSource/Remote/Questions/OCT_Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

abstract class OCT_Controller extends GetxController {
  PostDataOCT();
  getImageGallary();
}

class OctControllerImp extends OCT_Controller {
  late String filename;
  late Image image;
  StatusRequest? statusRequest;
  OctData octData = OctData(Get.find());
  File? file;
  List data = [];
  @override
  getImageGallary() async {
    final ImagePicker picker = ImagePicker();
    final PickedFile? imageGallary =
        await picker.getImage(source: ImageSource.gallery);
    file = File(imageGallary!.path);

    update();
  }

  @override
  PostDataOCT() async {
    statusRequest = StatusRequest.loading;
    String t = SharedPrefrenceHelper.getData(key: 't');
    var headers = {
      'Accept': 'application/json',
      'Authorization': t,
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://checkup.azad.digital/api/oct-submit'));
    request.fields.addAll({'filename': '1.jpg'});

    request.files
        .add(await http.MultipartFile.fromPath('image', '${file!.path}'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    statusRequest = handlingData(response);
    // print(file!.path);
    if (StatusRequest.success == statusRequest) {
      print(await response.stream.bytesToString());
      Get.delete<UserInfoController>();
      Get.offNamed(AppRoutes.Profile);
    }
    else {
      print(response.reasonPhrase);
      Get.defaultDialog(title: "Warning", middleText: "Can't be Empty");
      statusRequest = StatusRequest.failure ;
    }
    update();

  }


  @override
  void onInit() {
    super.onInit();
  }
}
