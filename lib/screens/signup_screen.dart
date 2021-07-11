import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:it_desk2/components/login_button.dart';
import 'package:it_desk2/components/login_divider.dart';
import 'package:it_desk2/components/login_text_field.dart';
import 'package:it_desk2/components/login_with_google_button.dart';
import 'package:it_desk2/constants.dart';
import 'package:it_desk2/screens/send_message_screen.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = 'signup_screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;
  String? password = '';
  String? repeatPassword = '';
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
                  'Sign Up',
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
                    hint: kHintPassword,
                    isPasswordField: true,
                    onValueChange: (value) {
                      this.password = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: LoginTextField(
                    isPasswordField: true,
                    hint: kHintRepeatPassword,
                    onValueChange: (value) {
                      this.repeatPassword = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: LoginButton(
                    title: 'Register',
                    onPress: () {
                      if (password!.length < 8) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Please enter a password greater than 8 characters.'),
                          ),
                        );
                        return;
                      }
                      if (password != repeatPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Passwords do not match'),
                          ),
                        );
                        return;
                      }
                      _registerUser();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Already have an account? Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _registerUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      Navigator.pop(context);
    } catch (e) {}
  }
}
