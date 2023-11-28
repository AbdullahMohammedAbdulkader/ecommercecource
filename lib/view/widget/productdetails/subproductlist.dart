import 'package:ecommercecource/controller/productdetails_controller.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubProductList extends GetView<ProductDetailsControllerImp> {
  const SubProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(controller.subItem.length, (index) => Container(
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 5),
          height: 60,
          width: 90,
          decoration: BoxDecoration(
              color: controller.subItem[index]["active"] == "1" ? AppColor.fourthcolor : AppColor.white,
              border: Border.all(color: AppColor.fourthcolor),
              borderRadius: BorderRadius.circular(10)
          ),
          child:  Text(controller.subItem[index]["name"], style:  TextStyle(
              color: controller.subItem[index]["active"] == "1" ? Colors.white : AppColor.primarycolor,
              fontWeight: FontWeight.bold
          )),
        )),
      ],
    );
  }
}
