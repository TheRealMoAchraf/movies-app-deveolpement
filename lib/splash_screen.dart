import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moviesapp/layout/home_page.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  const SplashScreen({Key? key}) : super(key: key); 

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _a = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        _a = !_a;
      });
    });
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.of(context).pushReplacement(SlideTransitionAnimation(const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            width: _a ? width : 0,
            height: height,
            color: Colors.black,
          ),
          Center(
            child: Image.asset(
              'assets/images/splash_screen.png',
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

class SlideTransitionAnimation extends PageRouteBuilder {
  final Widget page;

  SlideTransitionAnimation(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return SlideTransition(
              position: Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
                  .animate(animation),
              textDirection: TextDirection.rtl,
              child: child,
            );
          },
        );
}
