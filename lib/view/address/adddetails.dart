import 'package:ecommercecource/controller/address/addparttow_controller.dart';
import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/core/shared/custombutton.dart';
import 'package:ecommercecource/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(AddAddressDetailsController()) ;
    return Scaffold(
      appBar: AppBar(
        title:  Text(translateDatabase("اضافة تفاصيل العنوان ", "Add Details Address")),
      ),

      body: Container(
        padding: EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    CustomTextFormAuth(
                        hinttext: translateDatabase("المدينة", "City") ,
                        labeltext: translateDatabase("المدينة", "City"),
                        iconData: Icons.location_city,
                        valid: (val) { },
                        mycontroller: controller.city,
                        isNumber: false
                    ),
                    CustomTextFormAuth(
                        hinttext: translateDatabase("الشارع", "Street") ,
                        labeltext: translateDatabase("الشارع", "Street"),
                        iconData: Icons.streetview,
                        valid: (val) { },
                        mycontroller: controller.street,
                        isNumber: false
                    ),
                    CustomTextFormAuth(
                        hinttext: translateDatabase("الاسم", "Name") ,
                        labeltext: translateDatabase("الاسم", "Name"),
                        iconData: Icons.nest_cam_wired_stand,
                        valid: (val) { },
                        mycontroller: controller.name,
                        isNumber: false
                    ),
                    CustomButton(
                        text: translateDatabase("اضافة", "Add"),
                        onPressed: (){
                          controller.addAddressData();
                        })
                  ],
                )),)
      ),
    );
  }
}
