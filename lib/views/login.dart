import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prestmit_app/customs/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late PageController _controller;
  bool hasSeenSlide = false;
  bool _loading = false;
  int currentPage = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
    _controller.addListener(() {
      final newPage = _controller.page?.round() ?? 0;
      if (currentPage != newPage) {
        setState(() {
          currentPage = newPage;
        });
      }
      if ((currentPage >= _slides.length - 1)) _setSeen();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _setSeen() {
    setState(() {
      hasSeenSlide = true;
    });
  }

  void googleLogin() {
    setState(() {
      _loading = true;
    });

    Timer(const Duration(seconds: 3), () {
      setState(() {
        _loading = false;

        route();
      });
    });
  }

  route() {
    Navigator.pushReplacementNamed(context, '/nav');
  }

  List<Widget> get _slides => <Widget>[
        _slide(
            'Welcome to E-Bikes',
            'Buying Electric bikes just got a lot easier, Try us today.',
            'assets/svg/ill.svg'),
        _slide('Different', 'Something new', 'assets/svg/ill.svg'),
        _slide('Another', 'Totally different', 'assets/svg/ill.svg'),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainYellow,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _bigCircle(),
            _buildMainContent(),
            _lines(),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 6.w,
        height: 6.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == (currentPage % _slides.length)
              ? MyColors.appBlack
              : Colors.white,
        ),
      ),
    );
  }

  Widget _slide(
    String title,
    String subtitle,
    String image,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          SizedBox(height: 96.h),
          Text(
            title,
            style: GoogleFonts.inter(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: MyColors.appBlack),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              color: MyColors.gold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _bigCircle() {
    return Positioned(
      right: 80.h,
      top: -50.h,
      child: CircleAvatar(
        radius: 278.r,
        backgroundColor: MyColors.secondYellow,
      ),
    );
  }

  Widget _lines() {
    return Positioned(
      right: 0.h,
      top: 0.h,
      child: SvgPicture.asset('assets/svg/lines.svg'),
    );
  }

  Widget _buildMainContent() {
    return Column(
      children: [
        SizedBox(
          height: 70.h,
        ),
        SizedBox(
          height: 500.h,
          child: PageView(
            controller: _controller,
            children: _slides,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _slides.length,
            (index) => _buildDot(index),
          ),
        ),
        SizedBox(height: 48.h),
        _loading
            ? const CircularProgressIndicator(color: Colors.black)
            : GestureDetector(
                onTap: () {
                  googleLogin();
                },
                child: Container(
                  height: 56.h,
                  width: 327.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(52),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 60),
                        child: SvgPicture.asset('assets/svg/google.svg'),
                      ),
                      Text(
                        'Login with Google',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        SizedBox(height: 48.h),
        RichText(
          text: TextSpan(
            text: 'Don\'t have any account?',
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: MyColors.gold,
              letterSpacing: 0.5,
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' Sign Up',
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.appBlack,
                  letterSpacing: 0.5,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
