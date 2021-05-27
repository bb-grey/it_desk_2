import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginWithGoogleButton extends StatelessWidget {
  final Function? onClick;
  LoginWithGoogleButton({this.onClick});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick!();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.google,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0, top: 4.0),
            child: Text(
              'Log in with Google',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
