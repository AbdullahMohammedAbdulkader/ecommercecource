import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:ecommercecource/data/datasorce/remote/address_data.dart';
import 'package:ecommercecource/data/datasorce/remote/checkout_data.dart';
import 'package:ecommercecource/data/model/addressmodel.dart';
import 'package:ecommercecource/view/screen/checkout.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController{

  AddressData addressData = Get.put(AddressData(Get.find())) ;
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find())) ;

  MyServices myServices = Get.find() ;

  List<AddressModel> dataAddress = [] ;

  StatusRequest statusRequest = StatusRequest.none ;

  String? paymentMethod;
  String? deliveryType;
  String addressId = "0" ;
  late String couponId ;
  late String priceOrders ;
  late String couponDiscount ;

  choosePaymentMethod(String val){
    paymentMethod = val ;
    update() ;
  }
  chooseDeliveryType(String val){
    deliveryType = val ;
    update() ;
  }
  chooseShippingAddress(String val){
    addressId = val ;
    update() ;
  }

  getShippingAddress() async{
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(myServices.sharedPreferences.getString("id")!);
    print("=========================== controller $response") ;
    statusRequest = hindlingData(response) ;
    if(StatusRequest.success == statusRequest ){
      if(response["status"] == "success"){
        List listdata = response['data'] ;
        dataAddress.addAll(listdata.map((e) => AddressModel.fromJson(e))) ;
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update() ;
  }

  checkout() async{
    if (paymentMethod == null) return Get.snackbar("Error", "Please Select Payment Method") ;
    if (deliveryType == null) return Get.snackbar("Error", "Please Select Order Type") ;

    statusRequest = StatusRequest.loading;
    update() ;

    Map data = {
      "usersid" : myServices.sharedPreferences.getString("id"),
      "addressid" : addressId.toString(),
      "orderstype" : deliveryType.toString(),
      "orderspricedelivery" : "10" ,
      "ordersprice" : priceOrders,
      "couponid" : couponId,
      "coupondiscount" : couponDiscount.toString(),
      "orderspaymentmethod" : paymentMethod.toString(),
    };
    var response = await checkoutData.checkout(data);
    print("=========================== controller $response") ;
    statusRequest = hindlingData(response) ;
    if(StatusRequest.success == statusRequest ){
      if(response["status"] == "success"){
        Get.offAllNamed(AppRout.homepage) ;
        Get.snackbar("Success", "The Order Ws SuccessFully") ;
      } else {
        statusRequest = StatusRequest.none ;
        Get.snackbar("Error", "Try Again") ;
      }
    }
    update() ;
  }


  @override
  void onInit() {
    couponId = Get.arguments['couponId'] ;
    priceOrders = Get.arguments['priceOrder'] ;
    couponDiscount = Get.arguments['discountCoupon'].toString() ;
    getShippingAddress() ;
    super.onInit();
  }
}
