import 'package:ecommercecource/controller/items_controller.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 120,
      child: ListView.separated(
          separatorBuilder: (context , index) => const SizedBox(width: 10),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Categories(
                i: index,
                categoriesModel: CategoriesModel.fromJson(controller.categories[index]));
          }),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {

  final int? i ;
  final CategoriesModel categoriesModel ;
  const Categories({Key? key, required this.categoriesModel, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          //controller.goToItems(controller.categories, i!) ;
          controller.changecat(i!, categoriesModel.categoriesId!) ;
        },
        child: Column(
          children: [
            GetBuilder<ItemsControllerImp>(builder: (controller) => Container(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
              decoration: controller.selsectedCat == i ? const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 3,
                          color: AppColor.primarycolor
                      ))
              ) : null,
              child: Text("${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                style: const TextStyle(
                    color: AppColor.gray2,
                    fontSize: 20
                ),
              ),
            ))
          ],
        )
    );
  }
}
