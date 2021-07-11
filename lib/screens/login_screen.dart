import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:it_desk2/components/login_button.dart';
import 'package:it_desk2/components/login_divider.dart';
import 'package:it_desk2/components/login_text_field.dart';
import 'package:it_desk2/components/login_with_google_button.dart';
import 'package:it_desk2/constants.dart';
import 'package:it_desk2/screens/send_message_screen.dart';
import 'package:it_desk2/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email = '';
  String? password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              kCategoryScreenGradient1,
              kCategoryScreenGradient2,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 52.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    fontFamily: 'Lobster',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: LoginTextField(
                    hint: kHintEmail,
                    onValueChange: (value) {
                      this.email = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: LoginTextField(
                    isPasswordField: true,
                    hint: kHintPassword,
                    onValueChange: (value) {
                      this.password = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: LoginButton(
                    title: 'Log in',
                    onPress: () {
                      _loginUser();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: LoginButton(
                    title: 'Sign Up',
                    onPress: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Forgot your login details?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 24.0,
                    left: 32.0,
                    right: 32.0,
                  ),
                  child: LoginDivider(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: LoginWithGoogleButton(
                    onClick: () {
                      // Navigator.pushNamed(context, SendMessageScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loginUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      Navigator.pushNamed(context, SendMessageScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong password provided for that user.'),
          ),
        );
      }
    }
  }
}
