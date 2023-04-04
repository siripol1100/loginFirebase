import 'package:get/state_manager.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:loginfirebase/src/constants/colors.dart';
import 'package:loginfirebase/src/constants/image_string.dart';
import 'package:loginfirebase/src/constants/text_string.dart';
import 'package:loginfirebase/src/features/authentication/models/model_on_boaring.dart';
import 'package:loginfirebase/src/features/authentication/screens/on_boaring/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();

  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
        model: OnboaringModel(
      image: tOnBoardingImage1,
      title: tOnBoardingTitle1,
      subtitle: tOnBoardingSubTitle1,
      conunterText: tOnBoardingCounter1,
      bgColor: tOnboardingPage1Color,
      // height: size.height,
    )),
    OnBoardingPageWidget(
        model: OnboaringModel(
      image: tOnBoardingImage2,
      title: tOnBoardingTitle2,
      subtitle: tOnBoardingSubTitle2,
      conunterText: tOnBoardingCounter2,
      bgColor: tOnboardingPage2Color,
      // height: size.height,
    )),
    OnBoardingPageWidget(
        model: OnboaringModel(
      image: tOnBoardingImage3,
      title: tOnBoardingTitle3,
      subtitle: tOnBoardingSubTitle3,
      conunterText: tOnBoardingCounter3,
      bgColor: tOnboardingPage3Color,
      // height: size.height,
    ))
  ];

  skip() => controller.jumpToPage(page: 2);

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  onPageChangeCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
}
