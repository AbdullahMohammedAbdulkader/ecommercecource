
import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:ecommercecource/data/datasorce/remote/home_page.dart';
import 'package:ecommercecource/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchMixController{
  initialData() ;
  getdata() ;
  goToItems(List categories, int selsectedcat, String categoryid) ;
}

class HomeControllerImp extends HomeController{

  //List data = [] ;
  List categories = [];
  List items = [];
  //List items = [] ;


  HomeData homeData = HomeData(Get.find()) ;


  MyServices myServices = Get.find() ;

  String? username ;
  String? id ;
  String? lang ;

  @override
  initialData() {

    username = myServices.sharedPreferences.getString("username") ;
    id = myServices.sharedPreferences.getString("id") ;
    lang = myServices.sharedPreferences.getString("lang") ;
  }

  @override
  void onInit() {
    search = TextEditingController() ;
    //FirebaseMessaging.instance.subscribeToTopic("users") ;
    getdata() ;
    initialData() ;
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("=========================== controller $response") ;
    statusRequest = hindlingData(response) ;
    if(StatusRequest.success == statusRequest ){
      if(response["status"] == "success"){
        categories.addAll(response['categories']['data']) ;
        items.addAll(response['items']['data']) ;
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update() ;
  }





  @override
  goToItems(categories, selsectedCat, categoryid) {
    Get.toNamed(AppRout.items, arguments: {
      "categories"   : categories,
      "selsectedcat" : selsectedCat,
      "catid"   : categoryid
    }) ;

  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {
      "itemsmodel" : itemsModel
    });
  }

}

class SearchMixController extends GetxController{

  List<ItemsModel> listdata = [] ;
  late StatusRequest statusRequest ;


  searchdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    print("=========================== controller $response") ;
    statusRequest = hindlingData(response) ;
    if(StatusRequest.success == statusRequest ){
      if(response["status"] == "success"){
        listdata.clear() ;
        List responsedata = response['data'] ;
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e))) ;
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update() ;
  }


  TextEditingController? search ;
  bool isSearch = false ;

  HomeData homeData = HomeData(Get.find()) ;


  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none ;
      isSearch = false ;
    }
    update() ;
  }

  onSearchItems () {
    isSearch = true ;
    searchdata() ;
    update() ;
  }
}