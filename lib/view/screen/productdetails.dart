
// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecource/controller/productdetails_controller.dart';
import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/linkapi.dart';
import 'package:ecommercecource/view/widget/productdetails/priceandquantity.dart';
import 'package:ecommercecource/view/widget/productdetails/subproductlist.dart';
import 'package:ecommercecource/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return  Scaffold(
      bottomNavigationBar: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.secoundcolor,
          onPressed: (){

          },
          child: Text(translateDatabase("اضافة للسلة", "Add To Card"),
          style: const TextStyle(
            color: AppColor.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
          )),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                child: ListView(
                  children: [
                    const TopPageProductDetails(),
                    const SizedBox(height: 100),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${translateDatabase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}",
                              style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.secoundcolor)),
                          const SizedBox(height: 10),
                          PriceAndQuantity(
                              onAdd: () {

                                controller.add();
                              },
                              onRemove: () {

                                controller.remove() ;
                              },
                              quantity: "${controller.countitems}",
                              price: '${controller.itemsModel.itemsPrice}') ,
                          const SizedBox(height: 10),
                          Text("${translateDatabase(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)} ${translateDatabase(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)} ${translateDatabase(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)}",
                              style: Theme.of(context).textTheme.bodyText1!),
                          const SizedBox(height: 10),
                          //Text(translateDatabase("اللون", "Color"),
                          //  style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.secoundcolor)),
                          //const SizedBox(height: 10),
                          //const SubProductList() ,
                        ],
                      ),
                    )
                  ],
                ),
              )))
    );
  }
}
