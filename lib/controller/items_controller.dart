
import 'package:ecommercecource/controller/home_controller.dart';
import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:ecommercecource/data/datasorce/remote/items_data.dart';
import 'package:ecommercecource/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData() ;
  changecat(int val, String catval) ;
  getitems(String categoryid) ;
  goToPageProductDetails(ItemsModel itemsModel) ;
}

 class ItemsControllerImp extends SearchMixController {
   List categories = [];

   int? selsectedCat;

   String? catid ;

   ItemsData itemsData = ItemsData(Get.find());

   List data = [];

   late StatusRequest statusRequest;

   MyServices myServices = Get.find() ;

   @override
   void onInit() {
     search = TextEditingController() ;
     intialData();
     super.onInit();
   }

   @override
   intialData() {
     categories = Get.arguments['categories'];
     selsectedCat = Get.arguments['selsectedcat'];
     catid = Get.arguments['catid'] ;
     getitems(catid!) ;
   }

   @override
   changecat(val, catval) {
     selsectedCat = val;
     catid = catval ;
     getitems(catid!) ;
     update();
   }

   @override
   getitems(categoryid) async {
     data.clear() ;
     statusRequest = StatusRequest.loading;
     var response = await itemsData.getData(categoryid, myServices.sharedPreferences.getString("id")!);
     print("=========================== controller $response");
     statusRequest = hindlingData(response);
     if (StatusRequest.success == statusRequest) {
       if (response["status"] == "success") {
         data.addAll(response['data']);
       } else {
         statusRequest = StatusRequest.failure;
       }
       update();
     }
   }

  @override
  goToPageProductDetails(itemsModel) {
     Get.toNamed("productdetails", arguments: {
       "itemsmodel" : itemsModel
     });
  }
 }