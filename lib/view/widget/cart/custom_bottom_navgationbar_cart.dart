// ignore_for_file: prefer_const_constructors

import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:flutter/material.dart';

import 'buttonorder.dart';

class CustomBottomNavgationbarCart extends StatelessWidget {

  final String price ;
  final String shipping ;
  final String totalprice ;

  const CustomBottomNavgationbarCart({Key? key,
    required this.price,
    required this.shipping,
    required this.totalprice
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  translateDatabase("الاجمالي", "Price"),
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:  Text("$price",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  translateDatabase("الشحن", "Shipping"),
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:  Text("$shipping",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              )
            ],
          ),
          Divider(color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  translateDatabase("الاجمالي العام", "Total Price"),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primarycolor
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:   Text("$totalprice",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primarycolor
                  ),
                ),
              )
            ],
          ),

          SizedBox(height: 10),
          CustomButtonOrder(
            textbutton: translateDatabase("اتمام الطلب", "Place Order") ,
            onPressed: (){},
          )
        ],
      ),
    );
  }
}
