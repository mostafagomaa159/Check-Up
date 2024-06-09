
import 'package:checkup/Core/Constant/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/Services.dart';

class LocaleController extends GetxController {

  Locale? language ;
  MyServices myServices = Get.find()  ;
  ThemeData appTheme =themeEnglish;


  changeLang(String langcode){
    Locale locale = Locale(langcode) ;
    myServices.sharedPreferance.setString("lang", langcode) ;
    appTheme = langcode =="ar" ? themeArabic: themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale) ;
  }


  @override
  void onInit() {

    String? sharedPrefLang = myServices.sharedPreferance.getString("lang") ;
    if (sharedPrefLang == "ar"){

      language = const Locale("ar")  ;
      appTheme=themeArabic;
    }else if (sharedPrefLang == "en"){
      language = const Locale("en")  ;
      appTheme=themeEnglish;
    }else {
      language = Locale(Get.deviceLocale!.languageCode) ;
      appTheme=themeEnglish;

    }
    super.onInit();
  }


}