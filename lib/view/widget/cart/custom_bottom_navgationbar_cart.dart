// ignore_for_file: prefer_const_constructors

import 'package:ecommercecource/controller/cart_controller.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'buttonorder.dart';

class CustomBottomNavgationbarCart extends GetView<CartController> {

  final String price ;
  final String discount ;
  final String shipping ;
  final String totalprice ;
  final TextEditingController controllercoupon ;
  final void Function()? onApplyCoupon ;

  const CustomBottomNavgationbarCart({Key? key,
    required this.price,
    required this.discount,
    required this.totalprice,
    required this.controllercoupon,
    this.onApplyCoupon,
    required this.shipping,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(builder: (controller) =>
          controller.couponname == null ?
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: controllercoupon,
                        decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        hintText: translateDatabase("ادخل الكوبون", "ٍStart Coupon"),
                        border: OutlineInputBorder()
                        ),
                      ) ,
                    ),
                    SizedBox(width: 5),
                    Expanded(
                        flex: 1,
                        child: CustomButtonCoupon(
                          textbutton: translateDatabase("تطبيق", "Apply") ,
                          onPressed: onApplyCoupon,
                        )
                    ),
                  ],
                ),
              ) : Container(child: Text("Coupon Code ( ${controller.couponname!} )", style: TextStyle(
            color: AppColor.primarycolor, fontWeight: FontWeight.bold
          ),))
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primarycolor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
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
                        translateDatabase("الخصم", "Discount"),
                        style: TextStyle(
                            fontSize: 18
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:  Text("$discount",
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
                        translateDatabase("رسوم الشحن", "Shipping"),
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

              ],
            ),
          ),
          SizedBox(height: 10),
          CustomButtonOrder(
            textbutton: translateDatabase("اتمام الطلب", "Order") ,
            onPressed: (){
              controller.goToPageCheckout() ;
            },
          )
        ],
      ),
    );
  }
}
