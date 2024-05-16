import 'package:ecommercecource/controller/myfavorite_controller.dart';
import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/core/constant/routes.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/view/widget/customappbar.dart';
import 'package:ecommercecource/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController()) ;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(builder: (controller) => ListView(
          children: [
            /* CustomAppBar(
              titleappbar: translateDatabase("بحث عن المنتج", 'Search Product'),
              //onPressedIcon: (){},
              onPressedSearch: (){},
              onPressedFavorite: (){
                Get.toNamed(AppRout.myfavorite) ;
              },
            ),

             */
            const SizedBox(height: 20),
            HandlingDataView(
                statusRequest: controller.statusRequest, 
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    ),
                  itemBuilder: (context, index){
                      return CustomLiatFavoriteItems(itemsModel: controller.data[index]);
                    },
                )
            )
          ],
        )),

      ),
    );
  }
}
