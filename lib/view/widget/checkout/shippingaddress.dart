import 'package:ecommercecource/core/constant/color.dart';
import 'package:flutter/material.dart';

class ShippingAddressCheckOut extends StatelessWidget {
  final String title ;
  final String subtitle;
  final bool isActive ;
  const ShippingAddressCheckOut({Key? key,required this.title, required this.subtitle, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive == true ? AppColor.secoundcolor : AppColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child:  ListTile(
        title: Text(title, style: TextStyle(
            color: isActive == true ? AppColor.white : null,
            fontWeight: FontWeight.bold
        )),
        subtitle: Text(subtitle, style: TextStyle(
            color: isActive == true ? AppColor.white : null
        )),
      ),
    );
  }
}
