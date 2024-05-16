import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:ecommercecource/data/datasorce/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController{

  MyServices myServices = Get.find() ;

  LoginData loginData = LoginData(Get.find()) ;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true ;

  StatusRequest statusRequest = StatusRequest.none ;

  showpassword(){
    isshowpassword = isshowpassword == true ?false : true;
    update();
  }

  @override
  login() async{
    if(formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await loginData.postdata(email.text  , password.text);
      print("=========================== controller $response") ;
      statusRequest = hindlingData(response) ;
      if(StatusRequest.success == statusRequest ){
        if(response["status"] == "success"){
          // data.addAll(response['data']) ;

          if (response['data']['users_approve'] == "1"){
            myServices.sharedPreferences.setString("id", response['data']['users_id']) ;
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences.setString("username", response['data']['users_name']) ;
            myServices.sharedPreferences.setString("email", response['data']['users_email']) ;
            myServices.sharedPreferences.setString("phone", response['data']['users_phone']) ;
            myServices.sharedPreferences.setString("step", "2") ;
            // FirebaseMessaging.instance.subscribeToTopic("users") ;
            // FirebaseMessaging.instance.subscribeToTopic("users${userid}") ;


            Get.offNamed(AppRout.homepage);

          } else {
            Get.toNamed(AppRout.verifyCodeSignUp, arguments: {"email" : email.text}) ;
          }

        } else {
          Get.defaultDialog(title: "Warning" , middleText: "Email Or Password Not Correct") ;
          statusRequest = StatusRequest.failure ;
        }
      }
      update() ;
    }else{ }
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