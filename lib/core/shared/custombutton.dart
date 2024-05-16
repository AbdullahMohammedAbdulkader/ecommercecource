import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButton({Key? key, required this.text,  required this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 5),
        //onPressed: (){},
        color: AppColor.primarycolor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(
          fontSize: 16
        ),),
      ),
    );
  }
}
