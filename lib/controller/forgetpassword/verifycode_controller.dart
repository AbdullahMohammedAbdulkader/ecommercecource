import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/data/datasorce/remote/forgetpassword/verifycode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToResetPassword(String verifycoden);
}

class VerifyCodeControllerImp extends VerifyCodeController{

  String? email ;
  VerifyCodeForgetPasswordData verifyCodeforgetPasswordData = VerifyCodeForgetPasswordData(Get.find()) ;

  StatusRequest statusRequest = StatusRequest.none;


  @override
  checkCode() {
  }

  @override
  goToResetPassword(verifycoden) async {
    statusRequest = StatusRequest.loading;
    update();
    //Get.toNamed(AppRout.SuccessSignUp);
    var response = await verifyCodeforgetPasswordData.postdata(email!, verifycoden) ;
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRout.resetPassword , arguments: {
          "email" : email
        });
      } else {
        Get.defaultDialog(title: "Warning",
            middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    Get.toNamed(AppRout.resetPassword);
  }

  @override
  void onInit() {
    email = Get.arguments['email'] ;
    super.onInit();
  }

}