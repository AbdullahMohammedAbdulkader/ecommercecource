import 'package:ecommercecource/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;


  bool isshowpassword = true ;

  showpassword(){
    isshowpassword = isshowpassword == true ?false : true;
    update();
  }

  @override
  login() {
    var formdata = formstate.currentState ;
    if(formdata!.validate()){
      print("valid");
    }else{
      print("not valid");
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRout.SignUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRout.forgetPassword);
  }

}