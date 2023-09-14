import 'package:ecommercecource/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController{
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController passward;
  late TextEditingController repassward;

  @override
  resetpassword() {
    var formdata = formstate.currentState;
    if(formdata!.validate()){
      Get.toNamed(AppRout.SuccessResetPassword);
    }else{
      print("not valid");
    }
  }

  @override
  goToSuccessResetPassword() {
    Get.toNamed(AppRout.SuccessResetPassword);
  }

  @override
  void onInit() {
    passward    = TextEditingController();
    repassward    = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    passward.dispose();
    repassward.dispose();
    super.dispose();
  }



}