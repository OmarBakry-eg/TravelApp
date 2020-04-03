import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../reusable.dart';
import '../constant.dart';
import '../screens/home.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  var password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: SvgPicture.asset(
                    'img/signup.svg',
                    height: 300,
                    width: 300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration:
                        textFiledStyle.copyWith(hintText: 'Enter Your E-mail'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: textFiledStyle.copyWith(
                        hintText: 'Enter Your Password'),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Sign Up',
                  colour: Colors.black54,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email.trim(), password: password.trim());
                      if (newUser != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      }

                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
