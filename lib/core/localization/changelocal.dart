import 'dart:ui';
import 'package:ecommercecource/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../constant/apptheam.dart';

class  LocalController extends GetxController{
  Locale? language;

  MyServices myServices = Get.find();


  ThemeData appTheme = themeEnglish;


  changelang(String langcode){
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);

    appTheme = langcode == "ar" ? themeArabic : themeEnglish ;
    Get.changeTheme(appTheme);

    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");

    if(sharedPrefLang == "ar"){
      language = const Locale("ar");
      appTheme = themeArabic ;
    }else if(sharedPrefLang == "en"){
      language = const Locale("en");
      appTheme = themeEnglish ;
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish ;
    }

    super.onInit();
  }
}