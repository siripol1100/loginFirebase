import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginfirebase/src/repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  

  /// TextField Validation
  final Rx<Country> _selectedCountry = Country(
    phoneCode: "66",
    countryCode: "TH",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "thai",
    example: "thai",
    displayName: "thai",
    displayNameNoCountryCode: "TH",
    e164Key: "",
  ).obs;

  Country get selectedCountry => _selectedCountry.value;

  setCountry(Country data) {
    _selectedCountry.value = data;
    update();
  }

  //Call this Function from Design & it will do the rest
  Future<void> loginUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  void phoneAutentication(String phoneNo) async {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
