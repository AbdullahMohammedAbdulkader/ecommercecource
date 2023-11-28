import 'package:ecommercecource/controller/homescreen_controller.dart';
import 'package:ecommercecource/view/widget/home/custombuttomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppbarHome extends StatelessWidget {
  const CustomBottomAppbarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerIm>(builder: (controller) => BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        children: [
          ...List.generate(
              controller.listpage.length + 1, ((index) {
            int i = index > 2 ? index - 1 : index ;
            return index == 2 ? const Spacer() :CustomButtomAppbar(
                onPressed: (){
                  controller.changePage(i) ;
                } ,
                textbutton: controller.bottomappbar[i]['title'],
                iconhome: controller.bottomappbar[i]['icon'],
                active: controller.currentpage == i  ? true : false);
          }
          ))
        ],
      ),)
    );
  }
}
