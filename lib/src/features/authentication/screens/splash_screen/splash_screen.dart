import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginfirebase/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:loginfirebase/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:loginfirebase/src/constants/colors.dart';
import 'package:loginfirebase/src/constants/image_string.dart';
import 'package:loginfirebase/src/constants/sizes.dart';
import 'package:loginfirebase/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:loginfirebase/src/constants/text_string.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      body: Stack(
        children: [
          TFadeInAnimation(
              durationInMs: 2000,
              animationPosition: TAnimationPosition(
                  topBefore: 80,
                  topAfter: 80,
                  leftAfter: tDefaultSize,
                  leftBefore: -80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tAppName,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    tAppTagLine,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              )),
          TFadeInAnimation(
            durationInMs: 2400,
            animationPosition:
                TAnimationPosition(bottunBefore: 0, bottunAfter: 100),
            child: const Image(
              image: AssetImage(tSplashImage),
            ),
          ),
          TFadeInAnimation(
            durationInMs: 2400,
            animationPosition: TAnimationPosition(
                bottunBefore: 0,
                bottunAfter: 60,
                righBefore: tDefaultSize,
                righAfter: tDefaultSize),
            child: Container(
              width: tSplashContainerSize,
              height: tSplashContainerSize,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: tPrimaryColor),
            ),
          )
        ],
      ),
    );
  }
}
