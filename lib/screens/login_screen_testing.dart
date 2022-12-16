import 'package:docs_clone_flutter/colors.dart';
import 'package:docs_clone_flutter/provider/google_auth_provider.dart';
import 'package:docs_clone_flutter/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../provider/google_auth_provider.dart';
import '../provider/google_auth_provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
//   final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn _googleSignIn = GoogleSignIn();
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;
  Future<void> onsubmit(BuildContext context) async {
    print("object");
    await Provider.of<GauthProvider>(context, listen: false).signUpWithGoogle(context);
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: ElevatedButton.icon(
    //       onPressed: () {},
    //       icon: Image.asset(
    //         "assets/images/g-logo-2.png",
    //         height: 20,
    //       ),
    //       label: const Text("sign in with Google",style: TextStyle(color: darkFontColr),),
    //       style: ElevatedButton.styleFrom(
    //         backgroundColor: bgWhiteColor,
    //         minimumSize: const Size(150, 50),
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // height: deviceSize.height/2.4,
              // width: deviceSize.width/3,

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(''),
                ),
              ),
            ),
            Container(
              child: Form(
                // key: _userLoginFormKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 15, left: 10, right: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 14, left: 14, bottom: 8),
                          child: TextFormField(
                            controller: userIdController,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(fontSize: 15),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            ),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.emailAddress,
                            // inputFormatters: [
                            //   BlacklistingTextInputFormatter
                            //       .singleLineFormatter,
                            // ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, right: 14, left: 14, bottom: 8),
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                return TextFormField(
                                  controller: passwordController,
                                  obscureText: passwordVisible,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    hintText: "Password",
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    hintStyle: TextStyle(fontSize: 15),
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Color(0xFFE6E6E6),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            passwordVisible = !passwordVisible;
                                          });
                                        }),
                                  ),
                                  cursorColor: Colors.black,
                                  // inputFormatters: [
                                  //  BlacklistingTextInputFormatter
                                  //       .singleLineFormatter,
                                  // ],
                                );
                              },
                            )),
                        SizedBox(
                          height: 16,
                        ),
                    
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
