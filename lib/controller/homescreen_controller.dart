import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/view/screen/home.dart';
import 'package:ecommercecource/view/screen/setings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController{

  changePage(int currentpage) ;
}

class HomeScreenControllerIm extends HomeScreenController{
  int currentpage = 0 ;
  List<Widget> listpage =[
    const HomePage(),
    const Column(
      children: [
        Center(
          child: Text("Settings"),
        )
      ],
    ),
    const Column(
      children: [
        Center(
          child: Text("Profile"),
        )
      ],
    ),
    const Column(
      children: [
        Center(
          child: Setings() ,
        )
      ],
    ),
  ];

  List bottomappbar = [
    {
      "title": translateDatabase("الرئيسية", "Home"),
      "icon": Icons.home,
    },
    {
      "title": translateDatabase("الاشعارات", "Not"),
      "icon": Icons.notifications,
    },
    {
      "title": translateDatabase("من نحن", "Profile"),
      "icon": Icons.person_pin_sharp,
    },
    {
      "title": translateDatabase("الاعدادت", "Settings"),
      "icon": Icons.settings,
    }
  ];
  @override
  changePage(int i) {
    currentpage = i ;
    update() ;
  }

}