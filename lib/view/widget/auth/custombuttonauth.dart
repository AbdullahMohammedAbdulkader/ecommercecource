import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({Key? key, required this.text,  required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        //onPressed: (){},
        color: AppColor.gray,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
