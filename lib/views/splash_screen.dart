import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prestmit_app/config/routes.dart';
import 'package:prestmit_app/customs/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.of(context).pushReplacementNamed(AppRoute.loginscreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainYellow,
      body: Center(
        child: SvgPicture.asset(
          'assets/svg/p.svg',
          height: 100.h,
        ),
      ),
    );
  }
}
