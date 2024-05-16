import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:ecommercecource/data/datasorce/remote/address_data.dart';
import 'package:ecommercecource/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {

  StatusRequest statusRequest = StatusRequest.none ;
  AddressData addressData = AddressData(Get.find()) ;
  MyServices myServices = Get.find() ;


  TextEditingController? name   ;
  TextEditingController? city   ;
  TextEditingController? street ;

  String? lat ;
  String? long ;



  intialData () {
    name   = TextEditingController() ;
    city   = TextEditingController() ;
    street = TextEditingController() ;

    lat  = Get.arguments['lat'] ;
    long = Get.arguments["long"] ;
    print(lat) ;
    print(long) ;
  }

  addAddressData() async{
    statusRequest = StatusRequest.loading;
    update() ;

    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);
    print("=========================== controller $response") ;
    statusRequest = hindlingData(response) ;
    if(StatusRequest.success == statusRequest ){
      if(response["status"] == "success"){
        Get.offAllNamed(AppLink.homepage) ;
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update() ;
  }


  @override
  void onInit() {
    intialData () ;
    super.onInit();
  }
}