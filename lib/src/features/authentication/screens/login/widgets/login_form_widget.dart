import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginfirebase/src/constants/colors.dart';
import 'package:loginfirebase/src/constants/sizes.dart';
import 'package:loginfirebase/src/constants/text_string.dart';
import 'package:loginfirebase/src/features/authentication/controllers/login_controller.dart';
import 'package:loginfirebase/src/features/authentication/screens/forget_password/forget_password_options/forget_password_modal_bottom_sheet.dart';
import 'package:loginfirebase/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();

    controller.phoneNumber.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.phoneNumber.text.length));
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextFormField(
            //   controller: controller.email,
            //   decoration: const InputDecoration(
            //       prefixIcon: Icon(Icons.person_outline_outlined),
            //       labelText: tEmail,
            //       hintText: tEmail,
            //       border: OutlineInputBorder()),
            // ),
            // const SizedBox(height: tFormHeight - 20),
            // TextFormField(
            //   controller: controller.password,
            //   decoration: const InputDecoration(
            //       prefixIcon: Icon(Icons.fingerprint),
            //       labelText: tPassword,
            //       hintText: tPassword,
            //       border: OutlineInputBorder(),
            //       suffixIcon: IconButton(
            //           onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))),
            // ),
            StatefulBuilder(
              builder: (context, setState) {
                return Obx(() => TextFormField(
                      // controller: controller.phoneNumber,
                      onChanged: (value) {
                        setState(
                          () => controller.phoneNumber.text = value,
                        );
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  countryListTheme: const CountryListThemeData(
                                      bottomSheetHeight: 550),
                                  onSelect: (value) {
                                    controller.setCountry(value);
                                  },
                                );
                              },
                              child: Text(
                                '${controller.selectedCountry.flagEmoji} + ${controller.selectedCountry.phoneCode}',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            )),
                        suffixIcon: controller.phoneNumber.text.length > 9
                            ? Container(
                                height: 20,
                                width: 20,
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                                child: const Icon(
                                  Icons.done,
                                  color: tWhiteColor,
                                  size: 20,
                                ),
                              )
                            : null,
                        labelText: 'phone',
                        hintText: 'phone',
                        border: const OutlineInputBorder(),
                      ),
                      // onChanged: (value) {
                      //   setState(
                      //     () {
                      //       controller.phoneNumber.text = value;
                      //     },
                      //   );
                      // },
                    ));
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(tForgetPassword),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // LoginController.instance.loginUser(
                    //     controller.email.text.trim(),
                    //     controller.password.text.trim());
                    LoginController.instance.phoneAutentication(
                        '+${controller.selectedCountry.phoneCode}${controller.phoneNumber.text.trim()}');
                  }
                },
                child: Text(
                  tLogin.toUpperCase(),
                ),
              ),
            ),
          ],
        ));
  }
}
