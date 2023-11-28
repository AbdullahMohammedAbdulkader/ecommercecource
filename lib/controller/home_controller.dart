
import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:ecommercecource/data/datasorce/remote/home_page.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController{
  initialData() ;
  getdata() ;
  goToItems(List categories, int selsectedcat, String categoryid) ;
}


class HomeControllerImp extends HomeController{

  late StatusRequest statusRequest ;

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
        categories.addAll(response['categories']) ;
        items.addAll(response['items']) ;
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

}