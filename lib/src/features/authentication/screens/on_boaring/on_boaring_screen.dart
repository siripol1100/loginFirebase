import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:loginfirebase/src/constants/colors.dart';
import 'package:loginfirebase/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoaringScreen extends StatelessWidget {
  const OnBoaringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obcontroller = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obcontroller.pages,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            liquidController: obcontroller.controller,
            onPageChangeCallback: obcontroller.onPageChangeCallback,
          ),
          Positioned(
              bottom: 60,
              child: OutlinedButton(
                onPressed: () => obcontroller.animateToNextSlide(),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.black26),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20)),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: tDarkColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              )),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => obcontroller.skip(),
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: obcontroller.currentPage.value,
                count: 3,
                effect: WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
