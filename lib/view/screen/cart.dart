import 'package:ecommercecource/controller/cart_controller.dart';
import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:ecommercecource/view/widget/cart/customitemscartlist.dart';
import 'package:ecommercecource/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController()) ;
    return Scaffold(
      appBar: AppBar(
        title: Text(translateDatabase("سلتي", "My Cart")),
      ),
      bottomNavigationBar:  GetBuilder<CartController>(builder: (controller) => CustomBottomNavgationbarCart(
        shipping: "10",
        totalprice:  "${controller.getTotalPrice()}",
        controllercoupon: cartController.controllercoupon!,
        onApplyCoupon: () {
          controller.checkcoupon() ;
        },
        price: "${cartController.priceorder} \$",
        discount: "${controller.discountcoupon}%",
        )
      ),
      body: GetBuilder<CartController>(builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              // TopAppbarCart(title: translateDatabase("سلتي", "My Cart")),

              const SizedBox(height: 10),

              TopCardCart(
                  message: translateDatabase(
                      " لديك ${cartController.totalcountitems} صنف في القائمة ",
                      "You Have ${cartController.totalcountitems} Items In Your List")
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                   ...List.generate(cartController.data.length,
                         (index) =>  CustomItemsCartList(
                             onAdd: () async {
                               await cartController.add(cartController.data[index].itemsId!) ;
                               cartController.refrachpage() ;
                             }, 
                             onRemove: () async{
                               await cartController.delete(cartController.data[index].itemsId!) ;
                               cartController.refrachpage() ;
                             },
                           imagename: "${cartController.data[index].itemsImage}",
                           nameitem: translateDatabase(
                                 "${cartController.data[index].itemsNameAr}",
                                 "${cartController.data[index].itemsName}"),
                             price: "${cartController.data[index].itemsorice} \$",
                             count: "${cartController.data[index].countitems}",
                         ),
                   )
                  ],
                ),
              )
            ],
          )))
    );
  }
}
