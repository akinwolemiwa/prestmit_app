import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // startTimer();
  }

  // startTimer() async {
  //   var duration = const Duration(seconds: 5);
  //   return Timer(duration, route);
  // }

  // route() {
  //   Navigator.of(context)
  //       .pushReplacementNamed(AppRoute.onboarding //AppRoute.nav,
  //           );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
    );
  }
}
