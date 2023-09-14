// ignore_for_file: deprecated_member_use

import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/resetpassword_controller.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtitletextauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
        title: Text("Reset Password",
            style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.gray)
        ),
      ),
      body:  Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child:   ListView(
              children:  [
                const CustomTitleTextAuth(
                  text: "New Password",
                ),
                const SizedBox(height: 10),
                const CustomTextBodyAuth(
                  text: "Please Enter New Password",
                ),
                const SizedBox(height:45),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val){
                    return validInput(val!, 5, 30, "password");
                  },
                  mycontroller: controller.passward,
                  hinttext: "Enter Your Password",
                  labeltext: "Password",
                  iconData: Icons.lock_outline,
                  //mycontroller: ,
                ),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val){
                    return validInput(val!, 5, 30, "password");
                  },
                  mycontroller: controller.repassward,
                  hinttext: "Re Enter Your Password",
                  labeltext: "Password",
                  iconData: Icons.lock_outline,
                  //mycontroller: ,
                ),
                Container(
                  width: double.infinity,
                  child: CustomButtonAuth(
                    text: "Save",
                    onPressed: (){
                      controller.resetpassword();
                    },
                  ),
                ),
                const SizedBox(height: 40),
              ]),
        )

      ),
    );
  }
}
