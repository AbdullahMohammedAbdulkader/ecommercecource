// ignore_for_file: deprecated_member_use

import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/validinput.dart';
import 'package:ecommercecource/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtitletextauth.dart';
import '../../widget/auth/logoauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
        title: Text("Sign Up", style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.gray)),
      ),
      body:WillPopScope(
    onWillPop: alertExitApp,
    child:  GetBuilder<SignUpControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate ,
              child:   ListView(
                  children:  [
                    const CustomTitleTextAuth(
                      text: "Welcome Back",
                    ),
                    const SizedBox(height: 10),
                    const CustomTextBodyAuth(
                      text: "Sign Up With Your Email And Password Continue With Social Media",
                    ),
                    const SizedBox(height:45),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val){
                        return validInput(val!, 3, 20, "username");
                      },
                      mycontroller: controller.username,
                      hinttext: "Enter Your Username",
                      labeltext: "Username",
                      iconData: Icons.person_outline,
                      //mycontroller: ,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val){
                        return validInput(val!, 5, 100, "email");
                      },
                      mycontroller: controller.email,
                      hinttext: "Enter Your Email",
                      labeltext: "Email",
                      iconData: Icons.email_outlined,
                      //mycontroller: ,
                    ),
                    CustomTextFormAuth(
                      isNumber: true,
                      valid: (val){
                        return validInput(val!, 8, 15, "phone");
                      },
                      mycontroller: controller.phone,
                      hinttext: "Enter Your Phone",
                      labeltext: "Phone",
                      iconData: Icons.phone_android_outlined,
                      //mycontroller: ,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val){
                        return validInput(val!, 5, 30, "password");
                      },
                      mycontroller: controller.password,
                      hinttext: "Enter Your Password",
                      labeltext: "Password",
                      iconData: Icons.lock_outline,
                      //mycontroller: ,
                    ),
                    CustomButtonAuth(
                        text: "SignUp",
                        onPressed:(){
                          controller.signUp();
                        }
                    ),

                    const SizedBox(height: 30),
                    CustomTextSignUpOrSignIn(
                      textone: " have an account ? ",
                      texttow: " Sign In ",
                      onTap: (){
                        controller.goToSignIn();
                      },
                    )
                  ]),
            )

        ),
      ),
      )
    );
  }
}
