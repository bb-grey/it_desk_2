import 'package:flutter/material.dart';

class SplashButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onClick;
  final Color? color;
  SplashButton({this.title, this.onClick, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: Colors.blue,
      ),
      child: GestureDetector(
        child: Text(
          '$title',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        onTap: () {
          if (onClick != null) {
            onClick!();
          }
        },
      ),
    );
  }
}
