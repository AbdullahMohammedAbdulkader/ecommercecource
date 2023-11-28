import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/data/datasorce/remote/auth/verifycodesingup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController{


  checkCode();
  goToSuccessSignUp(String verificationCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {

  VerifyCodeSignUpData VerifyCodeSignUpdata = VerifyCodeSignUpData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  String? email;

  @override
  checkCode() {
  }

  @override
  goToSuccessSignUp(verificationCode) async {
      statusRequest = StatusRequest.loading;
      update();
      //Get.toNamed(AppRout.SuccessSignUp);
      var response = await VerifyCodeSignUpdata.postdata(email!, verificationCode);
      statusRequest = hindlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offNamed(AppRout.SuccessSignUp);
        } else {
          Get.defaultDialog(title: "Warning",
              middleText: "Verify Code Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }

  reSend(){
    VerifyCodeSignUpdata.resendData(email!);
  }

}
