import 'package:flutter/material.dart';
import 'package:loginfirebase/src/constants/sizes.dart';
import 'package:loginfirebase/src/features/authentication/screens/login/widgets/login_footer_widget.dart';
import 'package:loginfirebase/src/features/authentication/screens/login/widgets/login_form_widget.dart';
import 'package:loginfirebase/src/features/authentication/screens/login/widgets/login_herade_wiget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHerderWidget(size: size),
                const SizedBox(height: tFormHeight - 20),
                const LoginForm(),
                const SizedBox(height: tFormHeight - 20),
                const LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
