import 'package:ecommercecource/core/class/crud.dart';
import 'package:ecommercecource/linkapi.dart';


class CartData {
  Crud crud ;

  CartData(this.crud) ;

  addCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartAdd ,{"usersid" : usersid, "itemsid" : itemsid}) ;
    return response.fold((l) => l, (r) => r) ;
  }
  deleteCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartDelete ,{"usersid" : usersid, "itemsid" : itemsid}) ;
    return response.fold((l) => l, (r) => r) ;
  }
  getCountCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartgetcountitems ,{"usersid" : usersid, "itemsid" : itemsid}) ;
    return response.fold((l) => l, (r) => r) ;
  }

}