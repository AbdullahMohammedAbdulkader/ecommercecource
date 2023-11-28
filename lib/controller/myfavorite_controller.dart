import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:ecommercecource/data/datasorce/remote/favorite_data.dart';
import 'package:ecommercecource/data/datasorce/remote/myfavorite_data.dart';
import 'package:ecommercecource/data/model/myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController{

  late StatusRequest statusRequest ;
  MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());

  MyServices myServices = Get.find() ;

  List<MyFavoriteModel> data = [];

  getData() async {
    data.clear() ;
    statusRequest = StatusRequest.loading;
    var response = await myfavoriteData.getData(myServices.sharedPreferences.getString("id")!);
    print("=========================== controller $response");
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responsedata = response['data'] ;
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e))) ;

        print("data") ;

        print(data) ;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update() ;
  }
  deletefavorite(String favoriteid) async {
    //data.clear() ;
    //statusRequest = StatusRequest.loading;
    var response = await myfavoriteData.deleteData(favoriteid);
    data.removeWhere((element) => element.favoriteId == favoriteid) ;
    update() ;
  }

  @override
  void onInit() {
    getData() ;
    super.onInit();
  }
}