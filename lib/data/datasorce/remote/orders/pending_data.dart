import 'package:ecommercecource/core/class/crud.dart';
import 'package:ecommercecource/linkapi.dart';


class OrdersPendingData {
  Crud crud ;

  OrdersPendingData(this.crud) ;

  getData(String userid) async {
    var response = await crud.postData(AppLink.pendingOrders ,{
      "id" : userid
    }) ;
    return response.fold((l) => l, (r) => r) ;
  }
}