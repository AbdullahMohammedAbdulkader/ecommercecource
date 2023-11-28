import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {

  final String nameitem ;
  final String price ;
  final String count ;

  const CustomItemsCartList({Key? key,
    required this.nameitem,
    required this.price,
    required this.count
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Image.asset(
                        AppImageAsset.logoauth,
                        height: 90,
                        fit: BoxFit.cover,)),
                  Expanded(
                      flex: 3,
                      child: ListTile(
                        title: Text(nameitem,style: TextStyle(
                            fontSize: 15
                        )),
                        subtitle: Text(price, style: TextStyle(
                            color: AppColor.primarycolor,
                            fontSize: 17
                        )),)
                  ),
                  Expanded(
                      child: Column(children: [
                        Container(
                          height: 35,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add)
                          ),
                        ),
                        Container(
                            height: 30,
                            child: Text(count, style: TextStyle(
                                fontFamily: "sans"),
                            )
                        ),
                        Container(
                          height: 25,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove)
                          ),
                        ),
                      ],))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
