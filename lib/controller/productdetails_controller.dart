import 'package:ecommercecource/controller/cart_controller.dart';
import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController{

}

class ProductDetailsControllerImp extends ProductDetailsController {

  CartController cartController = Get.put(CartController()) ;

  late ItemsModel itemsModel ;
  late StatusRequest statusRequest ;

  int countitems = 0 ;

  intialData() async {
    statusRequest = StatusRequest.loading ;
    itemsModel = Get.arguments['itemsmodel'] ;
    countitems = await cartController.getCountItems(itemsModel.itemsId!) ;
    statusRequest = StatusRequest.success ;
    update() ;
  }

  add(){
    cartController.add(itemsModel.itemsId!) ;
    countitems++ ;
    update() ;
  }

  remove(){
    if(countitems > 0) {
      cartController.delete(itemsModel.itemsId!) ;
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