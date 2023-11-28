import 'package:ecommercecource/controller/home_controller.dart';
import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
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
          HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child:  ListView(
                children: [
                  CustomAppBar(
                    titleappbar: translateDatabase("بحث عن المنتج", 'Search Product'),
                    //onPressedIcon: (){},
                    onPressedSearch: (){},
                    onPressedFavorite: (){
                      Get.toNamed(AppRout.myfavorite) ;
                    },
                  ),
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
          ),)
      );
  }
}
