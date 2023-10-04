import 'package:ecommercecource/core/class/crud.dart';
import 'package:ecommercecource/linkapi.dart';

class SignupData {
  Crud crud ;

  SignupData(this.crud) ;

  postdata(String username ,String email ,String phone ,String password ) async {
    var response = await crud.postData(AppLink.signUp ,{
      "username" : username,
      "email" : email,
      "phone" : phone,
      "password" : password,
    }) ;
    return response.fold((l) => l, (r) => r) ;
  }
}