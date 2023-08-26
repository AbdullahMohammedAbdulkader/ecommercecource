import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasorce/static/static.dart';

class CutomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CutomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
        itemCount: OnBoardingList.length,
        itemBuilder: (context, i) => Column(
          children: [
            Text(OnBoardingList[i].title!,
                style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 80),
            Image.asset(OnBoardingList[i].image!, width: 250, height: 300, fit: BoxFit.fill),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(OnBoardingList[i].body!, textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
              )
            ),
          ],
        )
    );
  }
}
