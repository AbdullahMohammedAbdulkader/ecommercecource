import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttow;
  final void Function() onTap;
  const CustomTextSignUpOrSignIn({Key? key,
    required this.textone,
    required this.texttow,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(texttow ,
            style: const TextStyle(
              color: AppColor.primarycolor,
              fontWeight: FontWeight.bold
          ),),
        ),
      ],
    );
  }
}
