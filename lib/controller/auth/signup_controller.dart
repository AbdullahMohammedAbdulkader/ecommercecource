import 'package:ecommercecource/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController{
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;

  @override
  signUp() {
    //var formdata = formstate.currentState ;
    if(formstate.currentState!.validate()) {
      Get.offNamed(AppRout.verifyCodeSignUp);
    }else{ }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRout.login);
  }

  @override
  void onInit() {
    email    = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone    = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }



}