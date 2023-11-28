import 'package:ecommercecource/core/class/crud.dart';
import 'package:ecommercecource/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud ;

  VerifyCodeForgetPasswordData(this.crud) ;

  postdata(String email , String verifycode) async {
    var response = await crud.postData(AppLink.verifyCodeforgetpassword ,{
      "email" : email,
      "verifycode" : verifycode
    }) ;
    return response.fold((l) => l, (r) => r) ;
  }

}