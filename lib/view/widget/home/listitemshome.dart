import 'package:ecommercecource/controller/home_controller.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/data/model/itemsmodel.dart';
import 'package:ecommercecource/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {

  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , i){
            return Items(itemsModel: ItemsModel.fromJson(controller.items[i])) ;
          }),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;

  const Items({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network("${AppLink.imageitems}/${itemsModel.itemsImage}",
              //height: 100,
              width: 150,
              fit: BoxFit.fill
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColor.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 120,
          width: 200,
        ),
        Positioned(
          left: 10,
          child: Text("${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}", style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),),
        )
      ],
    );;
  }
}

