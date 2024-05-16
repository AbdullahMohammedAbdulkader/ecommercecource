import 'package:ecommercecource/controller/address/add_controller.dart';
import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController()) ;
    return Scaffold(
      appBar: AppBar(
        title:  Text(translateDatabase("اضافة عنوان جديد", "Add Adress New")),
      ),

      body: Container(
        child: GetBuilder<AddAddressController>(builder: (controllerpage) => HandlingDataView(
            statusRequest: controllerpage.statusRequest, widget: Column(
          children: [
            if(controllerpage.kGooglePlex != null)
            Expanded(
              child:  Stack(
                alignment: Alignment.center,
                children: [
                  GoogleMap(
                    onTap: (latlong){
                      controllerpage.addMarkers(latlong) ;
                    },
                    markers: controllerpage.markers.toSet(),
                    mapType: MapType.normal,
                    initialCameraPosition: controllerpage.kGooglePlex!,
                    onMapCreated: (GoogleMapController controllermap) {
                      controllerpage.completercontroller!.complete(controllermap);
                    },
                  ),
                  Positioned(
                    bottom: 10,
                      child: Container(
                        child: MaterialButton(
                          minWidth: 200,
                          onPressed: () {
                            controllerpage.goToPageAddressDetails() ;
                          },
                          child: Text("إكمال", style: TextStyle(fontSize: 18),),
                          color: AppColor.primarycolor,
                          textColor: AppColor.white,
                        )
                      )
                  )
                ],
              ),)
          ],
        ),))
      ),
    );
  }
}
