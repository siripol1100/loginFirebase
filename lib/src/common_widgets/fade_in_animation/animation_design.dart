import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginfirebase/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:loginfirebase/src/constants/sizes.dart';
import 'package:loginfirebase/src/constants/text_string.dart';
import 'package:loginfirebase/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';

class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    Key? key,
    required this.durationInMs,
    this.animationPosition,
    required this.child,
  }) : super(key: key);

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final TAnimationPosition? animationPosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top: controller.animate.value
            ? animationPosition!.topAfter
            : animationPosition!.topBefore,
        left: controller.animate.value
            ? animationPosition!.leftAfter
            : animationPosition!.leftBefore,
        bottom: controller.animate.value
            ? animationPosition!.bottunAfter
            : animationPosition!.bottunBefore,
        right: controller.animate.value
            ? animationPosition!.righAfter
            : animationPosition!.righBefore,
        child: AnimatedOpacity(
            duration: Duration(milliseconds: durationInMs),
            opacity: controller.animate.value ? 1 : 0,
            child: child),
      ),
    );
  }
}
