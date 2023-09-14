import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<bool> alertExitApp(){
   Get.defaultDialog(
    title: "تنبيه",
    middleText: "هل تريد الخروج من التطبيق",
    actions: [
      ElevatedButton(
          onPressed: (){
            exit(0);
            },
          child: const Text("نعم")),
      ElevatedButton(
          onPressed: (){
            Get.back();
          },
          child: const Text("لا"))
    ]);
  return Future.value(true);
}