import 'package:get/get_utils/src/get_utils/get_utils.dart';

validInput(String val ,int min ,int max ,String type){
  if(type == "username"){
    if(!GetUtils.isUsername(val)){
      return "not valid username";
    }
  }
  if(type == "email"){
    if(!GetUtils.isEmail(val)){
      return "not valid email";
    }
  }
  if(type == "phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "not valid phone";
    }
  }
  if(val.isEmpty){
    return "can't be Empty";
  }
  if(val.length < min){
    return "can't be less then $min";
  }
  if(val.length > max){
    return "can't be larger then $max";
  }
}