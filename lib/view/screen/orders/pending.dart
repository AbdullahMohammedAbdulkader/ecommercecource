import 'package:ecommercecource/controller/orders/pending_controller.dart';
import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/data/model/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController()) ;
    return Scaffold(
      appBar: AppBar(
        title: Text(translateDatabase("الطلبات", "Orders")),
      ),
      body: Container(
        child: GetBuilder<OrdersPendingController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget:  ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) => CardOrdersList(
              listData: controller.data[index],
            ),
          )),)
      ),
    );
  }
}

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrderModel listData ;
  const CardOrdersList({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(translateDatabase("رقم الطلب : ${listData.ordersId}", "Order Number : ${listData.ordersId}"), style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
            Divider(),
            Text(translateDatabase(" نوع الطلب : ${controller.printTypeOrder(listData.ordersType!)}",
                                   "Order Type : ${controller.printTypeOrder(listData.ordersType!)}")),
            Text(translateDatabase("  سعر الطب : ${listData.ordersPrice} \$", "Order Price : ${listData.ordersPrice} \$")),
            Text(translateDatabase(" سعر التوصيل : ${listData.ordersPricedelivery} \$", "Delivery Price : ${listData.ordersPricedelivery} \$")),
            Text(translateDatabase(" نوع الدفع : ${controller.printPaymentMethod(listData.ordersPaymentmethod!)}",
                                   "Payment Method : ${controller.printPaymentMethod(listData.ordersPaymentmethod!)}")),
            Text(translateDatabase(" حالة الطلب : ${controller.printOrderStatus(listData.ordersStatus!)}",
                "Order Status : ${controller.printPaymentMethod(listData.ordersStatus!)}")),
            Divider(),
            Row(
              children: [
                Text(translateDatabase(" الإجمالي : ${listData.ordersTotalprice} \$", "Total Price : ${listData.ordersTotalprice} \$"), style: TextStyle(
                    color: AppColor.primarycolor,
                    fontWeight: FontWeight.bold
                ),),
                Spacer(),
                MaterialButton(
                  onPressed: (){},
                  child: Text(translateDatabase("التفاصيل", "Details")),
                  color: AppColor.thirdcolor,
                  textColor: AppColor.secoundcolor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  }