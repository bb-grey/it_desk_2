import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      minWidth: double.infinity,
      onPressed: () {},
      child: Text(
        'Log in',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white60,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: BorderSide(
          color: Colors.white60,
          width: 1.0,
        ),
      ),
    );
  }
}
