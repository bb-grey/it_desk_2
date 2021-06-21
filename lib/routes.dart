import 'package:flutter/material.dart';
import 'package:it_desk2/screens/login_screen.dart';
import 'package:it_desk2/screens/main_category_screen.dart';
import 'package:it_desk2/screens/send_message_screen.dart';
import 'package:it_desk2/screens/signup_screen.dart';
import 'package:it_desk2/screens/solution_screen.dart';
import 'package:it_desk2/screens/topics_list_screen.dart';

final Map<String, WidgetBuilder> routes = {
  MainCategoryScreen.routeName: (context) => MainCategoryScreen(),
  TopicsListScreen.routeName: (context) => TopicsListScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SolutionScreen.routeName: (context) => SolutionScreen(),
  SendMessageScreen.routeName: (context) => SendMessageScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
};
