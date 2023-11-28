// ignore_for_file: deprecated_member_use

import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtitletextauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
        title: Text("Forget Password", style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.gray)),
      ),
      body:  GetBuilder<ForgetPasswordControllerImp>(builder: (controller) =>
      HandlingDataViewRequest(statusRequest:
        controller.statusRequest,
        widget:  Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child:   ListView(
                children:  [
                  const CustomTitleTextAuth(
                    text: "Check Email",
                  ),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(
                    text: "Please Enter Your Email Address To Recive A Verification Code",
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
                  CustomButtonAuth(
                      text: "Check",
                      onPressed:() {
                        controller.checkemail();
                      }
                  ),

                ]),
          )
      ),
           )
      )
    );
    }
  }

