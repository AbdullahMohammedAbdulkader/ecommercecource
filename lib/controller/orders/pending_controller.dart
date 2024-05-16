import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:ecommercecource/data/datasorce/remote/orders/pending_data.dart';
import 'package:ecommercecource/data/model/ordermodel.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController{
  List<OrderModel> data = [];
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find() ;


  String printTypeOrder(String val) {
    if (val == "0") {
      return  translateDatabase("توصيل", "Delivery") ;
    }else{
      return translateDatabase ("استلام من المكان","Drive") ;
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return translateDatabase("الدفع عند الاستلام", "Cash On Delivery");
    }else{
      return translateDatabase("بطاقة ائتمان", "Payment Card")  ;
    }
  }


  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "The Order is being Prepared" ;
    } else if (val == "2") {
      return "On The Way" ;
    } else {
      return "Archive" ;
    }
  }




  getOrders() async {
    data.clear() ;
    statusRequest = StatusRequest.loading;
    var response = await ordersPendingData.getData(myServices.sharedPreferences.getString("id")!);
    print("=========================== controller $response");
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listdata = response['data'] ;
        data.addAll(listdata.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }
  @override
  void onInit() {
    getOrders() ;
    super.onInit();
  }
}