import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/data/datasorce/remote/auth/signup.dart';
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

  SignupData signupData = SignupData(Get.find()) ;
  List data = [] ;
  late StatusRequest statusRequest ;

  @override
  signUp() async {
    //var formdata = formstate.currentState ;
    if(formstate.currentState!.validate()) {

      statusRequest = StatusRequest.loading;
      var response = await signupData.postdata(username.text, email.text , phone.text , password.text);
      print("=========================== controller $response") ;
      statusRequest = hindlingData(response) ;
      if(StatusRequest.success == statusRequest ){
        if(response["status"] == "success"){
         // data.addAll(response['data']) ;
          Get.offNamed(AppRout.verifyCodeSignUp);
        } else {
          Get.defaultDialog(title: "Warning" , middleText: "Phone Number Or Email Already Exists") ;
          statusRequest = StatusRequest.failure ;
        }
      }
      update() ;
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