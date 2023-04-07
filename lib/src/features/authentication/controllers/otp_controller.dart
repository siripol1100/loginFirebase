import 'package:get/get.dart';
import 'package:loginfirebase/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:loginfirebase/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:loginfirebase/src/features/core/screens/dashboard/dashboard.dart';
import 'package:loginfirebase/src/repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  final Rx<bool> _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  setIsLoading(bool data) {
    _isLoading.value = data;
    update();
  }

  void verifyOTP(String otp) async {
    setIsLoading(true);
    var isVerified =
        await AuthenticationRepository.instance.authenverifyOTP(otp);
    // isVerified ? Get.offAll(const Dashboard()) : Get.back();
    setIsLoading(false);
  }
}
