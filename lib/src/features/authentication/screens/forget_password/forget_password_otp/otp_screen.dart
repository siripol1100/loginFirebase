import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginfirebase/src/constants/sizes.dart';
import 'package:loginfirebase/src/constants/text_string.dart';
import 'package:loginfirebase/src/features/authentication/controllers/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OTPController());
    var otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOTPTitle,
              style:
                  GoogleFonts.kanit(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            Text(
              tOTPSubTitle,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 40),
            Text(
              '${tOTPMessage}support@hotmail.com',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (value) {
                // print('OTP is => $value');
                otp = value;
                controller.verifyOTP(otp);
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.verifyOTP(otp);
                },
                child: const Text(tNext),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
