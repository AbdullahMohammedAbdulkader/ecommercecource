import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:ecommercecource/data/datasorce/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{

  late StatusRequest statusRequest ;

  CartData cartData = CartData(Get.find());

  MyServices myServices = Get.find() ;


  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(myServices.sharedPreferences.getString("id")!, itemsid);
    print("=========================== controller $response");
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(title: "اشعار", messageText: const Text("تم اضافة المنتج الى السلة",style: TextStyle(
            color: AppColor.primarycolor))) ;
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.deleteCart(myServices.sharedPreferences.getString("id")!, itemsid);
    print("=========================== controller $response");
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(title: "اشعار", messageText: const Text("تم ازالة المنتج من السلة",style: TextStyle(
            color: AppColor.primarycolor))) ;
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(myServices.sharedPreferences.getString("id")!, itemsid);
    print("=========================== controller $response");
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print("================================");
        print("$countitems") ;
        return countitems ;
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  view(){}

}