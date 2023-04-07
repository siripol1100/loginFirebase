import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginfirebase/src/common_widgets/form/form_herder_widget.dart';
import 'package:loginfirebase/src/constants/image_string.dart';
import 'package:loginfirebase/src/constants/sizes.dart';
import 'package:loginfirebase/src/constants/text_string.dart';
import 'package:loginfirebase/src/features/authentication/controllers/signup_controller.dart';
import 'package:loginfirebase/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return SafeArea(
      child: Scaffold(body: GetBuilder<SignUpController>(
        builder: (controller) {
          return controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(tDefaultSize),
                    child: Column(
                      children: [
                        const FormHeaderWidget(
                            image: tWelcomeScreenImage,
                            subTitle: tSignUpSubTitle,
                            title: tSignUpTitle),
                        const SignUpFormWidget(),
                        Column(
                          children: [
                            const Text('OR'),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Image(
                                  image: AssetImage(tGoogleLogoImage),
                                  width: 20,
                                ),
                                label: Text(tSignInWithGoogle.toUpperCase()),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: tAlreadyHaveAnAccount,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    TextSpan(text: tLogin.toUpperCase())
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
        },
      )),
    );
  }
}
