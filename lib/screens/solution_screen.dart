import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SolutionScreen extends StatelessWidget {
  static const String routeName = 'solution_screen';
  @override
  Widget build(BuildContext context) {
    final String assetPath =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SfPdfViewer.asset(assetPath),
    );
  }
}
