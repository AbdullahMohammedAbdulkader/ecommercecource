import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String title ;
  final bool isActive ;
  final String image;
  const CardDeliveryTypeCheckout({Key? key,
    required this.title,
    required this.isActive,
    required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: isActive == true ? AppColor.secoundcolor : AppColor.white,
        border:Border.all(color: AppColor.primarycolor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 60,
            color: isActive == true ? AppColor.white : null,
          ),
          Text(title, style:  TextStyle(
            color: isActive == true ? AppColor.white : AppColor.secoundcolor,
            fontWeight: FontWeight.bold,
          )),
        ],
      ),
    );
  }
}
