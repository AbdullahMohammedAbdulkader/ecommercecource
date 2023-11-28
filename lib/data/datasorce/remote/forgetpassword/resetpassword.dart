import 'package:ecommercecource/core/class/crud.dart';
import 'package:ecommercecource/linkapi.dart';

class ResetPasswordData {
  Crud crud ;

  ResetPasswordData(this.crud) ;

  postdata(String email , String password) async {
    var response = await crud.postData(AppLink.resetPassword ,{
      "email" : email,
      "password" : password
    }) ;
    return response.fold((l) => l, (r) => r) ;
  }

}