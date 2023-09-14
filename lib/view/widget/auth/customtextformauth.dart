import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {

  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final String? Function(String?) valid;
  final TextEditingController? mycontroller;
  final bool isNumber;
  final bool? obscureText;
  final  void Function()? onTapIcon;

  const CustomTextFormAuth({Key? key,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    required this.valid,
    required this.mycontroller,
    required this.isNumber,
    this.obscureText,
    this.onTapIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeltext)
            ),
            suffixIcon:  InkWell(
              child: Icon(iconData),
              onTap: onTapIcon,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )
        ),
      ),
    );
  }
}
