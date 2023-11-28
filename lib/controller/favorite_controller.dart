import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:ecommercecource/data/datasorce/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController{

  late StatusRequest statusRequest ;
  FavoriteData favoriteData = FavoriteData(Get.find());

  MyServices myServices = Get.find() ;

  List data = [];
  Map isFavorite = {} ;

  setFavorite(id, val) {
    isFavorite[id] = val;
    update() ;
  }

  addFavorite(String itemsid) async {
    data.clear() ;
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(myServices.sharedPreferences.getString("id")!, itemsid);
    print("=========================== controller $response");
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(title: "اشعار", messageText: const Text("تم اضافة المنتج الى المفضلة",style: TextStyle(
            color: AppColor.primarycolor))) ;
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String itemsid) async {
    data.clear() ;
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(myServices.sharedPreferences.getString("id")!, itemsid);
    print("=========================== controller $response");
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(title: "اشعار", messageText: const Text("تم حذف المنتج من المفضلة", style: TextStyle(
            color: AppColor.primarycolor))) ;
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}