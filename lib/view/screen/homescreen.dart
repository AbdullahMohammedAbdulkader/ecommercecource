import 'package:ecommercecource/controller/homescreen_controller.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/view/widget/home/cutombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerIm()) ;
    return GetBuilder<HomeScreenControllerIm>(
        builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primarycolor,
            onPressed: (){},
            child: const Icon(Icons.shopping_basket_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppbarHome(),
      body: controller.listpage.elementAt(controller.currentpage),
    ));
  }
}
