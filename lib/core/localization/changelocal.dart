import 'dart:ui';
import 'package:ecommercecource/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

  requestPerLocation () async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمة تحديد الموقع") ;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق") ;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون اللوكيشين") ;
    }
  }



  @override
  void onInit() {
    requestPerLocation() ;
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