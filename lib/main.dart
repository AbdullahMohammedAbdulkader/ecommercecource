import 'package:ecommercecource/view/screen/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/constant/color.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    LocalController controller =  Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme:  ThemeData(
        fontFamily: "PlayFire",
        textTheme: const TextTheme(
          headline1:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColor.black),
          bodyText1: TextStyle(
              height: 2,
              color: AppColor.gray,
              fontWeight: FontWeight.bold,
              fontSize: 17
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Language(),
      routes: routes,
    );
  }
}

