import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginfirebase/src/constants/colors.dart';
import 'package:loginfirebase/src/constants/sizes.dart';
import 'package:loginfirebase/src/constants/text_string.dart';
import 'package:loginfirebase/src/features/authentication/controllers/signup_controller.dart';
import 'package:loginfirebase/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:loginfirebase/src/features/core/models/users/users_model.dart';
import 'package:loginfirebase/src/features/core/screens/dashboard/dashboard.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SignUpController());
    Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
          key: formKey,
          child: GetBuilder<SignUpController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      controller.selectImage(context);
                    },
                    child: controller.images == null
                        ? const CircleAvatar(
                            radius: 35,
                            child: Icon(
                              Icons.account_circle,
                              size: 50,
                              color: tCardBgColor,
                            ),
                          )
                        : CircleAvatar(
                            backgroundImage: FileImage(controller.images!),
                            radius: 35,
                          ),
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  TextFormField(
                    controller: controller.fullName,
                    decoration: const InputDecoration(
                        label: Text(tFullName),
                        prefixIcon: Icon(Icons.person_outline_rounded)),
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  TextFormField(
                    controller: controller.email,
                    decoration: const InputDecoration(
                        label: Text(tEmail),
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  TextFormField(
                    controller: controller.bio,
                    decoration: const InputDecoration(
                        label: Text('bio'), prefixIcon: Icon(Icons.numbers)),
                  ),
                  // TextFormField(
                  //   controller: controller.phoneNo,
                  //   decoration: const InputDecoration(
                  //       label: Text(tPhoneNo), prefixIcon: Icon(Icons.numbers)),
                  // ),
                  // const SizedBox(height: tFormHeight - 20),
                  // TextFormField(
                  //   controller: controller.password,
                  //   decoration: const InputDecoration(
                  //       label: Text(tPassword),
                  //       prefixIcon: Icon(Icons.fingerprint)),
                  // ),
                  const SizedBox(height: tFormHeight - 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // SignUpController.instance.registerUser(
                            //     controller.email.text.trim(),
                            //     controller.password.text.trim());
                            // SignUpController.instance
                            //     .phoneAutentication(controller.phoneNo.text.trim());
                            // Get.to(() => OTPScreen());
                            storeData(controller);
                          }
                        },
                        child: Text(tSignup.toUpperCase())),
                  )
                ],
              );
            },
          )),
    );
  }

  Future storeData(SignUpController controller) async {
    UserModel userModel = UserModel(
        name: controller.fullName.text.trim(),
        email: controller.email.text.trim(),
        bio: controller.bio.text.trim(),
        profilePic: "",
        createdAt: "",
        phoneNumber: "",
        uid: "");

    if (controller.images != null) {
      controller.savaUserDataToFirebase(
          userModel: userModel,
          profilePic: controller.images!,
          onSuccess: () {
            controller.saveUserDataToSp().then((value) {
              Get.offAll(const Dashboard());
            });
          });
    } else {
      Get.snackbar('Error', 'upload profile');
    }
  }
}
