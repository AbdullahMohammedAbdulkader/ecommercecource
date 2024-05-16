import 'package:ecommercecource/core/class/crud.dart';

import '../../../linkapi.dart';

class CheckoutData {
  Crud crud ;

  CheckoutData(this.crud) ;

  checkout(Map data) async {
    var response = await crud.postData(AppLink.checkOut , data) ;
    return response.fold((l) => l, (r) => r) ;
  }
}