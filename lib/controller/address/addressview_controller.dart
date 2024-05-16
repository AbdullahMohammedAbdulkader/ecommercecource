import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/functions/hindlingdatacontroller.dart';
import 'package:ecommercecource/core/services/services.dart';
import 'package:ecommercecource/data/datasorce/remote/address_data.dart';
import 'package:ecommercecource/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {

  AddressData addressData = AddressData(Get.find()) ;

  List<AddressModel> data = [] ;
  late StatusRequest statusRequest ;

  MyServices myServices = Get.find() ;

  deleteAddress (String addressid)  {
    addressData.deleteData(addressid) ;
    data.removeWhere((element) => element.addressId == addressid) ;
    update() ;
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(myServices.sharedPreferences.getString("id")!);
    print("=========================== controller $response") ;
    statusRequest = hindlingData(response) ;
    if(StatusRequest.success == statusRequest ){
      if(response["status"] == "success"){
        List listData = response['data'] ;
        data.addAll(listData.map((e) => AddressModel.fromJson(e))) ;
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update() ;
  }
  @override
  void onInit() {
    getData() ;
    super.onInit();
  }

}