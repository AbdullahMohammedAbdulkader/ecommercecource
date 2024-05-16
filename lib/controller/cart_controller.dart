import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:ecommercecource/data/datasorce/remote/cart_data.dart';
import 'package:ecommercecource/data/model/cartmodel.dart';
import 'package:ecommercecource/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbols.dart';

class CartController extends GetxController{

  TextEditingController? controllercoupon ;

  int? discountcoupon = 0;
  String? couponname ;
  String? couponid ;

  late StatusRequest statusRequest ;

  CartData cartData = CartData(Get.find());

  CouponModel? couponModel ;

  MyServices myServices = Get.find() ;

  List<CartModel> data = [] ;

  double priceorder = 0.0 ;
  int totalcountitems = 0 ;

  goToPageCheckout() {
    if(data.isEmpty) return Get.snackbar("تنبيه", " السلة فارغة");
    Get.toNamed(AppRout.checkOut, arguments: {
      "couponId"   : couponid ?? "0" ,
      "priceOrder" : priceorder.toString() ,
      "discountCoupon" : discountcoupon.toString()
    }) ;
  }

  add(String itemsid) async {
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
  delete(String itemsid) async {
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

  getTotalPrice() {
    return (priceorder - priceorder * discountcoupon! / 100) ;
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

  resetVarCart() {
    totalcountitems = 0 ;
    priceorder = 0.0 ;
    data.clear() ;
  }

  refrachpage() {
    resetVarCart() ;
    view() ;
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update() ;
    var response = await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("=========================== controller $response");
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        if (response['data']['status'] == 'success') {
          List dataresponse = response['data']['data']  ;
          Map dataresponsecountprice = response['countprice'] ;
          data.clear() ;
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e))) ;
          totalcountitems = int.parse(dataresponsecountprice['totalcount']) ;
          priceorder      = double.parse(dataresponsecountprice['totalprice']) ;
        } else {

        }

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update() ;
  }

  checkcoupon() async{
    statusRequest = StatusRequest.loading;
    update() ;
    var response = await cartData.checkcoupon(controllercoupon!.text);
    print("=========================== controller $response");
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Map<String, dynamic> datacoupon = response['data'] ;
        couponModel = CouponModel.fromJson(datacoupon) ;
        discountcoupon = int.parse(couponModel!.couponDiscount!) ;
        couponname = couponModel!.couponName ;
        couponid   = couponModel!.couponId ;
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0 ;
        couponname = null ;
        couponid = null ;
        Get.snackbar("Warning", "Coupon is Valid") ;
      }
    }
    update() ;
  }


@override
  void onInit() {
  controllercoupon = TextEditingController() ;
    view() ;
    super.onInit();
  }

}