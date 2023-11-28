import 'package:ecommercecource/controller/home_controller.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/data/model/categoriesmodel.dart';
import 'package:ecommercecource/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);
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

class Categories extends GetView<HomeControllerImp> {

  final int? i ;
  final CategoriesModel categoriesModel ;
  const Categories({Key? key, required this.categoriesModel, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i!, categoriesModel.categoriesId!) ;
      },
        child: Column(
          children: [
            Container(
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.thirdcolor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              width: 70,
              child: SvgPicture.network(
                  "${AppLink.imagecategories}/${categoriesModel.categoriesImage}", color: AppColor.primarycolor),
            ),
            Text("${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
              style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 14
              ),
            ),
          ],
        )
    );
  }
}
