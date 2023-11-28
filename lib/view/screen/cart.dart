import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/constant/imageassets.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/view/widget/cart/appbartopcart.dart';
import 'package:ecommercecource/view/widget/cart/buttonorder.dart';
import 'package:ecommercecource/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:ecommercecource/view/widget/cart/customitemscartlist.dart';
import 'package:ecommercecource/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavgationbarCart(
        price: "1200 \$",
        shipping: "300 \$",
        totalprice:  "1500 \$",
      ),
      body: ListView(
        children: [
          TopAppbarCart(title: translateDatabase("سلتي", "My Cart")),

          const SizedBox(height: 10),

          const TopCardCart(message: "You Have 2 Items In Your List"),

          const CustomItemsCartList(
              nameitem: "Sewing Machine",
              price: "1200 \$",
              count: "2"
          ),
          const CustomItemsCartList(
              nameitem: "Sewing Machine",
              price: "400 \$",
              count: "3"
          ),
          const CustomItemsCartList(
              nameitem: "Sewing Machine",
              price: "600 \$",
              count: "1"
          ),
        ],
      ),
    );
  }
}
