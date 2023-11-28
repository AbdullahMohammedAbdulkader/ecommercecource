import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecource/controller/myfavorite_controller.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/data/model/myfavorite.dart';
import 'package:ecommercecource/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLiatFavoriteItems extends GetView<MyFavoriteController> {

  final MyFavoriteModel itemsModel ;
  //final bool active ;
  const CustomLiatFavoriteItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  InkWell(
      onTap: (){
        //controller.goToPageProductDetails(itemsModel) ;
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageitems}/" + itemsModel.itemsImage!,
                  height: 100, fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              Text("${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}", style: const TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("12345",
                      textAlign: TextAlign.center
                  ),
                  Container(
                    height: 22,
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        ...List.generate(5, (index) => Icon(Icons.star, size: 15))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${itemsModel.itemsPrice} \$", style: const TextStyle(
                      color: AppColor.primarycolor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "sans")),
                  IconButton(
                      onPressed: (){
                        controller.deletefavorite(itemsModel.favoriteId!) ;
                      },
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        color: AppColor.primarycolor,
                      )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
