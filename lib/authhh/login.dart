import '../screens/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import 'signup.dart';
import '../reusable.dart';

class LoignPage extends StatefulWidget {
  @override
  _LoignPageState createState() => _LoignPageState();
}

class _LoignPageState extends State<LoignPage> {
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
                    'img/login.svg',
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
                  title: 'Log In',
                  colour: Colors.black54,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email.trim(), password: password.trim());
                      if (user != null) {
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ));
                  },
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'OR ',
                        style: richText,
                      ),
                      TextSpan(
                        text: 'SignUp',
                        style: omarBakry,
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
