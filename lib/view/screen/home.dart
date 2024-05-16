import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecource/controller/home_controller.dart';
import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/data/model/itemsmodel.dart';
import 'package:ecommercecource/linkapi.dart';
import 'package:ecommercecource/view/widget/customappbar.dart';
import 'package:ecommercecource/view/widget/home/customcardhome.dart';
import 'package:ecommercecource/view/widget/home/customtitlehome.dart';
import 'package:ecommercecource/view/widget/home/listcategorieshome.dart';
import 'package:ecommercecource/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp()) ;
    return GetBuilder<HomeControllerImp>(builder: (controller) =>
        Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ?Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCardHome(
                    titlecard: translateDatabase("مفاجأة الصيف", "A Summer Surprise"),
                    subtitlecard: translateDatabase("استرداد نقدي 20%", "CashBack 20%"),
                  ),
                  CustomTitleHome(
                      title: translateDatabase("الأقسام", 'Categories ')
                  ),
                  const ListCategoriesHome(),
                  CustomTitleHome(
                      title: translateDatabase("منتجات لك", 'Product For You ')
                  ),
                  const ListItemsHome() ,
                  CustomTitleHome(
                      title: translateDatabase("عروض", 'Offer ')
                  ),
                  const ListItemsHome() ,
                ],
              )
                  : ListItemsSearch(listdatamodel: controller.listdata),
            )
                ],
              )
          ),
      );
  }
}


class ListItemsSearch extends GetView<HomeControllerImp> {

  final List<ItemsModel> listdatamodel ;

  const ListItemsSearch({Key? key,
    required this.listdatamodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              controller.goToPageProductDetails(listdatamodel[index]) ;
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                              imageUrl: "${AppLink.imageitems}/${listdatamodel[index].itemsImage}"
                          )
                      ),
                      Expanded(
                          flex: 2 ,
                          child: ListTile(
                            title: Text(
                                translateDatabase("${listdatamodel[index].itemsNameAr}", "${listdatamodel[index].itemsName}")),
                            subtitle: Text(
                                translateDatabase("${listdatamodel[index].categoriesNameAr}", "${listdatamodel[index].categoriesName}")),
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
    });
  }
}


