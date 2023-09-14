import 'package:ecommercecource/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/auth/successsignup_controller.dart';
import '../../../core/constant/color.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp()) ;

    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
        title: Text("Success",
            style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.gray)
        ),
      ),
     body: Container(
       padding: const EdgeInsets.all(15),
       child:  Column(
         children: [
          const Center(
               child: Icon(
                   Icons.check_circle_outline,
                   size: 200,
                   color: AppColor.primarycolor)),
           const Text("...."),
           const Spacer(),
           Container(
             width: double.infinity,
             child : CustomButtonAuth(
                 text: "Go To Login",
                 onPressed:(){
                   controller.goToPageLogin();
                 }
             ),
           ),

           const SizedBox(height: 30),
         ],
       ),
     ),
    );
  }
}
