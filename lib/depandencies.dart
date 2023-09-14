import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'controller/auth/signup_controller.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp() , fenix: true);
  }

}