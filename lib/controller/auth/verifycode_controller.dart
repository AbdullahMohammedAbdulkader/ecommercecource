import 'package:ecommercecource/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController{

  late String verifycode ;

  @override
  checkCode() {
  }

  @override
  goToResetPassword() {
    Get.toNamed(AppRout.resetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }

}