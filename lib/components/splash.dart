import 'package:flutter/material.dart';
import '../constants.dart';

class Splash extends StatelessWidget {
  final Image? image;
  final String? title;
  final String? description;

  Splash({this.image, this.title, this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(kDefaultScreenPadding),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: image,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: Text(
                    '$title',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    '$description',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
