import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecource/controller/favorite_controller.dart';
import 'package:ecommercecource/controller/items_controller.dart';
import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/data/model/itemsmodel.dart';
import 'package:ecommercecource/linkapi.dart';
import 'package:ecommercecource/view/screen/home.dart';
import 'package:ecommercecource/view/widget/customappbar.dart';
import 'package:ecommercecource/view/widget/items/customlistitems.dart';
import 'package:ecommercecource/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp()) ;
    FavoriteController controllerFav = Get.put(FavoriteController()) ;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child:  ListView(
                  children: [
                    CustomAppBar(
                      myController: controller.search!,
                      onChanged: (val) {
                        controller.checkSearch(val) ;
                      },
                      titleappbar: translateDatabase("بحث عن المنتج", 'Search Product'),
                      //onPressedIcon: (){},
                      onPressedSearch: (){
                        controller.onSearchItems() ;
                      },
                      onPressedFavorite: (){
                        Get.toNamed(AppRout.myfavorite) ;
                      },
                    ),
                    const SizedBox(height: 20) ,
                    const ListCategoriesItems(),
                    GetBuilder<ItemsControllerImp>(builder: (controller) =>
                        HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: !controller.isSearch ? GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.data.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
                                itemBuilder: (BuildContext context, index){
                                  controllerFav.isFavorite[controller.data[index]['items_id']] = controller.data[index]['favorite'] ;
                                  return CustomLiatItems(
                                      itemsModel: ItemsModel.fromJson(controller.data[index])
                                  );
                                }
                            ) : ListItemsSearch(listdatamodel: controller.listdata),
                        )
                    )
                  ],
                )
            )
        );
  }
}
