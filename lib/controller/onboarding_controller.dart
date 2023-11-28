import 'dart:ffi';

import 'package:ecommercecource/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../data/datasorce/static/static.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController{

  late PageController pageController;

  int currentPage = 0;

  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;
    if(currentPage > OnBoardingList.length - 1){
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRout.login);
    }else{
      pageController.animateToPage(currentPage,
          duration:const Duration(microseconds: 600),
          curve:Curves.easeInOut
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
  
}