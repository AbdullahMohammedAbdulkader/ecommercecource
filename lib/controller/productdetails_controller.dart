import 'package:ecommercecource/controller/cart_controller.dart';
import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:ecommercecource/data/datasorce/remote/cart_data.dart';
import 'package:ecommercecource/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController{

}

class ProductDetailsControllerImp extends ProductDetailsController {

  //CartController cartController = Get.put(CartController()) ;

  CartData cartData = CartData(Get.find());

  MyServices myServices = Get.find() ;

  late ItemsModel itemsModel ;
  late StatusRequest statusRequest ;

  int countitems = 0 ;

  intialData() async {
    statusRequest = StatusRequest.loading ;
    itemsModel = Get.arguments['itemsmodel'] ;
    countitems = await getCountItems(itemsModel.itemsId!) ;
    statusRequest = StatusRequest.success ;
    update() ;
  }

  additems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update() ;
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
    update() ;
  }
  deleteitems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update() ;
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
    update() ;
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
  add(){
    additems(itemsModel.itemsId!) ;
    countitems++ ;
    update() ;
  }

  remove(){
    if(countitems > 0) {
      deleteitems(itemsModel.itemsId!) ;
      countitems-- ;
      update() ;
    }
  }

  List subItem = [
    {"name": "red", "id": 1, "active": '0' },
    {"name": "black", "id": 2, "active": '0' },
    {"name": "white", "id": 3, "active": '1' }
  ];

  @override
  void onInit(){
    intialData() ;
    super.onInit() ;
  }
}