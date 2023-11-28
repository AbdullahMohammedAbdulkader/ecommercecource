import 'package:ecommercecource/controller/home_controller.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String titlecard ;
  final String subtitlecard ;
  const CustomCardHome({Key? key, required this.titlecard, required this.subtitlecard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                color: AppColor.primarycolor,
                borderRadius: BorderRadius.circular(20)
            ),
            alignment: Alignment.center,
            child:  ListTile(
              title: Text(titlecard, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20
              )),
              subtitle: Text(subtitlecard, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              )),
            ),
          ),
          Positioned(
              top: -20,
              right: controller.lang == "en" ? -20 : null,
              left: controller.lang == "ar" ? -20 : null,
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    color: AppColor.secoundcolor,
                    borderRadius: BorderRadius.circular(160)
                ),
              )
          )

        ],
      ),
    );
  }
}
