

import 'package:checkup/Core/Class/crud.dart';
import 'package:checkup/linkApi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.test, {}, );
    return response.fold((l) => l, (r) => r);
  }
}