// ignore_for_file: deprecated_member_use

import 'dart:ffi';

import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/alertexitapp.dart';
import 'package:ecommercecource/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/auth/login_controller.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtitletextauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
        title: Text("Sign In", style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.gray)),
      ),
      body:  WillPopScope(
          onWillPop: alertExitApp,
          child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form (
            key: controller.formstate,
            child:   ListView(
                children:  [
                  const LogoAuth(),
                  const CustomTitleTextAuth(
                    text: "Welcome Back",
                  ),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(
                    text: "Sign In With Your Email And Password Continue With Social Media",
                  ),
                  const SizedBox(height:45),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val){
                      return validInput(val!, 5, 100, "email") ;
                    },
                    mycontroller: controller.email,
                    hinttext: "Enter Your Email",
                    labeltext: "Email",
                    iconData: Icons.email_outlined,
                    //mycontroller: ,
                  ),
                  GetBuilder<LoginControllerImp>(builder: (controller) => CustomTextFormAuth(
                    obscureText: controller.isshowpassword,
                    onTapIcon: (){
                      controller.showpassword();
                    },
                    isNumber: false,
                    valid: (val){
                      return validInput(val!, 5, 30, "password") ;
                    },
                    mycontroller:controller.password ,
                    hinttext: "Enter Your Password",
                    labeltext: "Password",
                    iconData: Icons.lock_outline,
                    //mycontroller: ,
                  ),
                  ),
                  InkWell(
                    onTap: (){
                      controller.goToForgetPassword();
                    },
                    child: const Text("Forget Password",
                        textAlign: TextAlign.end
                    ),
                  ),
                  CustomButtonAuth(
                      text: "Sign In",
                      onPressed:() {
                        controller.login();
                      }
                  ),
                  const SizedBox(height: 30),
                  CustomTextSignUpOrSignIn(
                    textone: "Don't have an account ? ",
                    texttow: "SignUp",
                    onTap: (){
                      controller.goToSignUp();
                    },
                  ),
                ]),
          )

      ),
      )
    );
  }
}
