import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/data/datasorce/remote/forgetpassword/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController{
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{

  CheckEmailData checkEmailData = CheckEmailData(Get.find()) ;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;

  StatusRequest statusRequest = StatusRequest.none ;


  @override
  checkemail() async{
    var formdata = formstate.currentState ;
    if(formdata!.validate()){
      statusRequest = StatusRequest.loading;
      update() ;
      Get.offNamed(AppRout.verifCcode, arguments: {
        "email" : email.text
      });
      var response = await checkEmailData.postdata(email.text);
      print("=========================== controller $response") ;
      statusRequest = hindlingData(response) ;
      if(StatusRequest.success == statusRequest ){
        if(response["status"] == "success"){
          // data.addAll(response['data']) ;
          Get.offNamed(AppRout.verifCcode, arguments: {
            "email" : email.text
          });
        } else {
          Get.offNamed(AppRout.forgetPassword) ;
          Get.defaultDialog(title: "Warning" , middleText: "Email Not Found") ;
          statusRequest = StatusRequest.failure ;
        }
      }
      update() ;
    }
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