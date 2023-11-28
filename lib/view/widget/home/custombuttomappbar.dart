import 'package:ecommercecource/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtomAppbar extends StatelessWidget {

  final void Function()? onPressed ;
  final String textbutton ;
  final IconData iconhome ;
  final bool? active;
  const CustomButtomAppbar({Key? key, this.onPressed, required this.textbutton, required this.iconhome, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconhome, color: active == true ? AppColor.primarycolor  : AppColor.gray2),
          Text(textbutton, style: TextStyle(color: active == true ? AppColor.primarycolor  : AppColor.gray2)),
        ],
      ),
    );
  }
}
