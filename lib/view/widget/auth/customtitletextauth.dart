// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomTitleTextAuth extends StatelessWidget {
  final String text ;
  const CustomTitleTextAuth({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2
    );

  }
}
