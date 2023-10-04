import 'package:ecommercecource/core/class/statusrequest.dart';

hindlingData(response){
  if (response is StatusRequest){
    return response ;
  }else{
    return StatusRequest.success ;
  }
}