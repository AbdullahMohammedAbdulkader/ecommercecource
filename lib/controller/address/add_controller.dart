import 'dart:async';

import 'package:ecommercecource/core/class/statusrequest.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {

  StatusRequest statusRequest = StatusRequest.loading ;

  Completer<GoogleMapController>? completercontroller ;

  Position? position ;

  List<Marker> markers = [] ;

  double? lat ;
  double? long ;

  addMarkers (LatLng latLng) {
    markers.clear() ;
    markers.add(Marker(markerId: MarkerId("1"), position: latLng)) ;
    lat = latLng.latitude ;
    long = latLng.longitude ;
    update() ;
  }

  goToPageAddressDetails () {
    Get.toNamed(AppRout.addressaddDetails , arguments: {
      "lat" : lat.toString() ,
      "long": long.toString()
    }) ;
  }



  CameraPosition? kGooglePlex ;

  getCurrentLocation () async {
    position = await Geolocator.getCurrentPosition() ;
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none ;
    update() ;
  }


  @override
  void onInit() {
    getCurrentLocation() ;
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}