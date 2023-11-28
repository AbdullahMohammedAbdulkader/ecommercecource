// ignore_for_file: deprecated_member_use
import 'package:ecommercecource/controller/forgetpassword/verifycode_controller.dart';
import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecource/view/widget/auth/customtitletextauth.dart';
import 'package:flutter/material.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';


class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
        title: Text("Verification Code",
            style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.gray)),
      ),
      body: GetBuilder<VerifyCodeControllerImp>(builder: (controller) =>
          HandlingDataViewRequest(statusRequest:
            controller.statusRequest,
            widget:Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child:   ListView(
            children:  [
              const CustomTitleTextAuth(
                text: "Check Code",
              ),
              const SizedBox(height: 10),
              const CustomTextBodyAuth(
                text: "Please Enter The Digit Code Sent To Abdu@gmail.com",
              ),
              SizedBox(height:45),
              OtpTextField(
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor:  Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
                  controller.goToResetPassword(verificationCode);
                }, // end onSubmit
              ),
            ]),
      ),
          )
      )
    );
  }
}
