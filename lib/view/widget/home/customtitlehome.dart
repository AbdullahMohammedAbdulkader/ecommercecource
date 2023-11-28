import 'package:ecommercecource/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTitleHome extends StatelessWidget {

  final String title ;
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style:  const TextStyle(
        color: AppColor.primarycolor,
        fontSize: 20,
        fontWeight: FontWeight.bold )
      ),
    );
  }
}
