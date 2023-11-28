import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/data/datasorce/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController{
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController{

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find()) ;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController passward;
  late TextEditingController repassward;

  String? email ;

  StatusRequest statusRequest = StatusRequest.none ;

  @override
  resetpassword() async {
    if(passward.text != repassward.text) return Get.defaultDialog(title: "warning", middleText: "Password Not Match") ;
    statusRequest = StatusRequest.loading;
    update();
    Get.offNamed(AppRout.SuccessResetPassword);
    //Get.toNamed(AppRout.SuccessSignUp);
    var response = await resetPasswordData.postdata(email!, passward.text);
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRout.SuccessResetPassword);
      } else {
        Get.defaultDialog(title: "Warning",
            middleText: "Try Again");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToSuccessResetPassword() {
    var formdata = formstate.currentState;
    if(formdata!.validate()){
      Get.toNamed(AppRout.SuccessResetPassword);
    }else{
      print("not valid");
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'] ;
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