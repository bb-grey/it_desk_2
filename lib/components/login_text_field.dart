import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String? hint;
  LoginTextField({@required this.hint});
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white70,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        filled: true,
        fillColor: Colors.white24,
      ),
    );
  }
}
