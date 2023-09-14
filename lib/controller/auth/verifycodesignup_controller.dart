import 'package:ecommercecource/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  checkCode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController{

  late String verifycode ;

  @override
  checkCode() {
  }

  @override
  goToSuccessSignUp() {
    Get.toNamed(AppRout.SuccessSignUp);
  }

  @override
  void onInit() {
    super.onInit();
  }

}