import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SettingsController extends GetxController{

  MyServices myServices = Get.find() ;

  logout(){

    myServices.sharedPreferences.clear() ;
    Get.offAllNamed(AppRout.login) ;

  }

}

