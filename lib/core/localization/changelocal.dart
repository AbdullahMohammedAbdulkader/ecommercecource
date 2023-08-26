import 'dart:ui';
import 'package:ecommercecource/core/services/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class  LocalController extends GetxController{
  Locale? language;

  MyServices myServices = Get.find();

  changelang(String langcode){
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");

    if(sharedPrefLang == "ar"){
      language = const Locale("ar");
    }else if(sharedPrefLang == "en"){
      language = const Locale("en");
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}