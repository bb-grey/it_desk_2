import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPress;
  LoginButton({this.title = 'Log in', this.onPress});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      minWidth: double.infinity,
      onPressed: onPress,
      child: Text(
        title!,
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
