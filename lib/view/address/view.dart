import 'package:ecommercecource/controller/address/addressview_controller.dart';
import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController()) ;
    return Scaffold(
      appBar: AppBar(
        title:  Text(translateDatabase("العناوين", "Adress")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(AppRout.addressAdd) ;
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<AddressViewController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
        child: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context, i) {
            return CardAddress(
              addressModel: controller.data[i],
              onDeleteAddress: (){
                controller.deleteAddress(controller.data[i].addressId!) ;
              },
            );
          },
        ),
      ),),)
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel ;
  final void Function()? onDeleteAddress ;
  const CardAddress({Key? key, required this.addressModel, this.onDeleteAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text(addressModel.addressName!),
          subtitle: Text("${addressModel.addressCity} ${addressModel.addressStreet}"),
          trailing: IconButton(onPressed: onDeleteAddress, icon: Icon(Icons.delete_outline)),
        ),
      ),
    );
  }
}
