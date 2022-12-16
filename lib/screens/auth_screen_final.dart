import 'package:docs_clone_flutter/provider/apple_auth_provider.dart';
import 'package:docs_clone_flutter/widget/signup_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/google_auth_provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  Future<void> onSubmitGoogleSignup(BuildContext context) async {
    print("object");
    await Provider.of<GauthProvider>(context, listen: false)
        .signUpWithGoogle(context);
    print("object");
  }

  Future<void> onSubmitAppleSignup(BuildContext context) async {
    print("object");
    await Provider.of<AppeAuthProvider>(context, listen: false)
        .signInWithApple(context);
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    final mxheight = MediaQuery.of(context).size.height;
    final mxwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => onSubmitGoogleSignup(context),
              child: SignupCard(
                mxheight: mxheight,
                mxwidth: mxwidth,
                title: "Signup with Google",
                imagepath: "assets/images/g-logo-2.png",
              ),
            ),
            // InkWell(
            //   onTap: () => onSubmitAppleSignup(context),
            //   child: SignupCard(
            //     mxheight: mxheight,
            //     mxwidth: mxwidth,
            //     title: "Signup with Apple",
            //     imagepath: "assets/images/g-logo-2.png",
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}
