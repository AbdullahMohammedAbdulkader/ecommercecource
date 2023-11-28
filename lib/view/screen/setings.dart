import 'package:ecommercecource/controller/settings_controller.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/constant/imageassets.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setings extends StatelessWidget {
  const Setings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController()) ;
    return Container(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor.primarycolor,
              ),
              Positioned(
                  top: Get.width / 5,
                  child:Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child:  CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(AppImageAsset.avatar),
                    ),
                  )
              ),
            ],
          ),
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    //onTap: (){},
                    title: Text(translateDatabase("ايقاف الاشعارات", "Disable Notifications")),
                    trailing: Switch(onChanged: (val){}, value: true),
                  ),
                  ListTile(
                    onTap: (){},
                    title: Text(translateDatabase("العنوان", "Address")),
                    trailing: Icon(Icons.location_on_outlined),
                  ),
                  ListTile(
                    onTap: (){},
                    title: Text(translateDatabase("من نحن", "About us")),
                    trailing: Icon(Icons.help_outline_rounded),
                  ),
                  ListTile(
                    onTap: (){},
                    title: Text(translateDatabase("للتواصل", "Contact us")),
                    trailing: Icon(Icons.phone_callback_outlined),
                  ),
                  ListTile(
                    onTap: (){
                      controller.logout() ;
                    },
                    title: Text(translateDatabase("خروج", "Logout")),
                    trailing: Icon(Icons.exit_to_app),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
