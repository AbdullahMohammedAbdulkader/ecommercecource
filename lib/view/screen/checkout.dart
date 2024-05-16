import 'package:ecommercecource/controller/checkout_controller.dart';
import 'package:ecommercecource/core/class/handlingdataview.dart';
import 'package:ecommercecource/core/constant/color.dart';
import 'package:ecommercecource/core/constant/imageassets.dart';
import 'package:ecommercecource/core/functions/translatedatabase.dart';
import 'package:ecommercecource/view/widget/checkout/carddeliverytype.dart';
import 'package:ecommercecource/view/widget/checkout/cardpaymentmethod.dart';
import 'package:ecommercecource/view/widget/checkout/shippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckOutController controller = Get.put(CheckOutController()) ;
    return  Scaffold(
      appBar: AppBar(
        title: Text(translateDatabase("الدفع","CheckOut")),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          color: AppColor.secoundcolor,
          textColor: AppColor.white,
          onPressed: () {
            controller.checkout() ;
          },
          child: Text(translateDatabase("الدفع", "Checkout"), style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),),
        ),
      ),

      body: GetBuilder<CheckOutController>(
        builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest , widget: Container(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children:  [
              Text(translateDatabase("اختر وسيلة الدفع", "Choose Payment Method"), style: const TextStyle(
                  color: AppColor.secoundcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              )),
              const SizedBox(height: 10),

              InkWell(
                onTap: (){
                  controller.choosePaymentMethod("0") ; // 0 => cash
                },
                child: CardPaymentMethodCheckout(
                    title: translateDatabase("الدفع عند التوصيل", "Cash On Delivery"),
                    isActive: controller.paymentMethod == "0" ? true : false
                ),
              ),

              const SizedBox(height: 10),

              InkWell(
                onTap: (){
                  controller.choosePaymentMethod("1") ; // 1 => card
                },
                child: CardPaymentMethodCheckout(
                    title: translateDatabase("بطاقات الدفع", "Payment Cards"),
                    isActive: controller.paymentMethod == "1" ? true : false
                ),
              ),



              const SizedBox(height: 20),

              Text(translateDatabase("اختر نوعية التوصيل", "Choose Delivery Type"), style: const TextStyle(
                  color: AppColor.secoundcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              )),
              const SizedBox(height: 10),
              Row(
                children: [

                  InkWell(
                    onTap: (){
                      controller.chooseDeliveryType("0"); // 0 => delivery
                    },
                    child: CardDeliveryTypeCheckout(
                      title: translateDatabase("توصيل", "Delivery"),
                      isActive: controller.deliveryType == "0" ? true : false,
                      image: AppImageAsset.delivery,
                    ),
                  ),

                  const SizedBox(width: 10),

                  InkWell(
                    onTap: (){
                      controller.chooseDeliveryType("1"); // 1 => drive
                    },
                    child: CardDeliveryTypeCheckout(
                      title: translateDatabase("من الموقع", "Drive Thru"),
                      isActive: controller.deliveryType == "1" ? true : false,
                      image: AppImageAsset.drivethru ,
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 20),

              if(controller.deliveryType == "0")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(translateDatabase("عنوان التوصيل", "Shipping Address"), style: const TextStyle(
                      color: AppColor.secoundcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  )),
                  const SizedBox(height: 10),

                  ...List.generate(controller.dataAddress.length, (index) => InkWell(
                    onTap: (){
                      controller.chooseShippingAddress(controller.dataAddress[index].addressId!);
                    },
                    child:  ShippingAddressCheckOut(
                        title: "${controller.dataAddress[index].addressName}",
                        subtitle: "${controller.dataAddress[index].addressCity} ${controller.dataAddress[index].addressStreet}",
                        isActive: controller.addressId == controller.dataAddress[index].addressId ? true : false
                    ),
                  ),)
                ],
              ),

            ],
          ),
        ),),
      ),
    );
  }
}
