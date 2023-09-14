import 'package:ecommercecource/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController{
  checkemail();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;

  @override
  checkemail() {
    var formdata = formstate.currentState ;
    if(formdata!.validate()){
      Get.toNamed(AppRout.verifCcode);
    }else{
      print("not valid");
    }
  }

  @override
  goToVerfiyCode() {
    Get.toNamed(AppRout.verifCcode);
  }

  @override
  void onInit() {
    email    = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }



}