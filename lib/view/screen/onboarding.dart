import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/onboarding_controller.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child:  CutomSliderOnBoarding(),
            ),
            Expanded(
              flex: 1,
                child: Column(
              children: [
                 DotControllerOnBoarding(),
                 Spacer(flex: 2),
                 CustomButtonOnBoarding(),
              ],
            )),
          ],
        )
      )
    );
  }
}
