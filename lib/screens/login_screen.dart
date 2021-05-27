import 'package:flutter/material.dart';
import 'package:it_desk2/components/login_button.dart';
import 'package:it_desk2/components/login_divider.dart';
import 'package:it_desk2/components/login_text_field.dart';
import 'package:it_desk2/components/login_with_google_button.dart';
import 'package:it_desk2/constants.dart';
import 'package:it_desk2/screens/send_message_screen.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'login_screen';
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
                  child: LoginTextField(hint: kHintEmail),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: LoginTextField(hint: kHintPassword),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: LoginButton(),
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
                      Navigator.pushNamed(context, SendMessageScreen.routeName);
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
}
