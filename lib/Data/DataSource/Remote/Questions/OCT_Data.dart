import 'dart:io';


import 'package:checkup/Core/Class/crud.dart';
import 'package:checkup/linkApi.dart';

class OctData {
  Crud crud;
  OctData(this.crud);
  postOctData(String fileName, File image) async {
    var response = await crud.postData(AppLink.postOCT, {
      "filename": fileName,
      "image": image,
    });
    return response.fold((l) => l, (r) => r);
  }
}
