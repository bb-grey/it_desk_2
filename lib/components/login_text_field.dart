import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String? hint;
  final Function(String)? onValueChange;
  final bool? isPasswordField;
  LoginTextField({
    @required this.hint,
    this.onValueChange,
    this.isPasswordField: false,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white,
      ),
      onChanged: onValueChange,
      obscureText: isPasswordField!,
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
