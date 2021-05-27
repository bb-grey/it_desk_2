import 'package:flutter/material.dart';

class PageNumberRepresenter extends StatelessWidget {
  final int? currentPage;
  PageNumberRepresenter({@required this.currentPage});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 100),
            margin: EdgeInsets.only(right: 6.0),
            height: currentPage == index ? 10 : 7,
            width: 3,
            color: Colors.grey[600],
          );
        },
      ),
    );
  }
}

// Container(
//           margin: EdgeInsets.only(right: 6.0),
//           height: 16,
//           width: 3,
//           color: Colors.grey[600],
//         ),
