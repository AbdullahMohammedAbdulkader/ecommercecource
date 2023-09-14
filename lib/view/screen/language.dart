// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/localization/changelocal.dart';
import '../widget/language/custombuttonlang.dart';

class Language extends GetView<LocalController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr ,style: Theme.of(context).textTheme.headline1),
            const SizedBox(height:20),
            CustomButtonLang(textbutton: "2".tr, onPressed: (){
              controller.changelang('ar');
              Get.toNamed(AppRout.onBoarding);
            }),
            CustomButtonLang(textbutton: "3".tr, onPressed: (){
              controller.changelang('en');
              Get.toNamed(AppRout.onBoarding);
            })
          ],
        ),
      ),
    );
  }
}
