import 'package:flutter/material.dart';
import 'package:it_desk2/components/splash.dart';
import 'package:preload_page_view/preload_page_view.dart';

class SplashScreen extends StatefulWidget {
  final Function(int)? onPageChanged;
  final int? pageNumber;
  final PreloadPageController? pageController;
  SplashScreen({this.onPageChanged, this.pageNumber, this.pageController});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Widget> pages = [
    Splash(
      image: Image.asset('assets/images/splash/splash1.jpg'),
      title: 'Welcome VPN Hub',
      description:
          'A new user just signed up and a hearty handshake is not possible, so now, what?',
    ),
    Splash(
      image: Image.asset('assets/images/splash/splash2.jpg'),
      title: 'Welcome VPN Hub',
      description:
          'A new user just signed up and a hearty handshake is not possible, so now, what?',
    ),
    Splash(
      image: Image.asset('assets/images/splash/splash3.jpg'),
      title: 'Welcome VPN Hub',
      description:
          'A new user just signed up and a hearty handshake is not possible, so now, what?',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PreloadPageView.builder(
      itemBuilder: (context, position) {
        return pages[position];
      },
      itemCount: pages.length,
      preloadPagesCount: pages.length,
      scrollDirection: Axis.horizontal,
      onPageChanged: widget.onPageChanged,
      controller: widget.pageController,
    );
  }
}
