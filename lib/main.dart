import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'screens/home_screen.dart';
import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // ignore: non_constant_identifier_names
  Future<void> _I() async {
    await FirebaseAppCheck.instance
        .activate(webRecaptchaSiteKey: 'recaptcha-v3-site-key');
  }

  @override
  Widget build(BuildContext context) {
    _I();
    return MaterialApp(
      title: kAppTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: kCategoryScreenGradient1,
        accentColor: kCategoryScreenGradient2,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Connectivity Error'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return HomeScreen();
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
      routes: routes,
    );
  }
}
