// ignore_for_file: deprecated_member_use
import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controller/auth/verifycodesignup_controller.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtitletextauth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
        title: Text("Verification Code",
            style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.gray)),
      ),
      body:  GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) =>
            HandlingDataViewRequest(statusRequest:
              controller.statusRequest,
              widget:  Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child:   ListView(
            children:  [
              const CustomTitleTextAuth(
                text: "Check Code",
              ),
              const SizedBox(height: 10),
              CustomTextBodyAuth(
                text: "Please Enter The Digit Code Sent To ${controller.email}",
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
                  controller.goToSuccessSignUp(verificationCode);
                }, // end onSubmit
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: (){
                  controller.reSend() ;
                },
                child:  Center(
                  child:  Text("${translateDatabase('Resend Verify Code', 'اعادة ارسال الرمز')}", style: const TextStyle(
                    color: AppColor.primarycolor,
                    fontSize: 20,
                  )),
                ),

              )
            ]),
      ),
            )
      )
    );
  }
}
