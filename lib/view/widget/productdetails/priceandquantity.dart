import 'package:ecommercecource/controller/productdetails_controller.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceAndQuantity extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String quantity ;
  final String price ;
  const PriceAndQuantity({Key? key, required this.onAdd, required this.onRemove, required this.quantity, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return  Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
                alignment: Alignment.center,
                //padding: const EdgeInsets.only(bottom: 2),
                width: 50,
                decoration:BoxDecoration(
                    border: Border.all(color: AppColor.black),
                    borderRadius: BorderRadius.circular(10)
                ),
                child:  Text(quantity, style: const TextStyle(
                  fontSize: 20,
                  //height: 1.1,
                ),
                )
            ),
            IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text("$price \$", style: const TextStyle(
            color: AppColor.primarycolor,
            fontSize: 25,
            height: 1.1
        ),),
      ],
    );
  }
}
