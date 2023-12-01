import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:prestmit_app/customs/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:prestmit_app/views/home/your_orders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool hasSeenSlide = false;

  List cardList = [
    Image.asset('assets/png/bikee.png', fit: BoxFit.contain),
    Image.asset('assets/png/bikee.png', fit: BoxFit.contain),
    Image.asset('assets/png/bikee.png', fit: BoxFit.contain),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1587064712555-6e206484699b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGJsYWNrJTIwbWFufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                  backgroundColor: Colors.transparent,
                ),
                SvgPicture.asset('assets/svg/notif.svg')
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Hello good Morning!',
              style: GoogleFonts.inter(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                color: MyColors.appBlack,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          _bikes(),
          _yourOrders(),
          _join(),
        ],
      ),
    );
  }

  Widget _bikes() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 265.h,
            autoPlay: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            viewportFraction: 0.7,
            enableInfiniteScroll: false,
          ),
          items: cardList.map((card) {
            return Builder(builder: (BuildContext context) {
              return Container(
                width: 255.w,
                decoration: BoxDecoration(
                  color: MyColors.lightGrey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: card,
              );
            });
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(cardList, (index, url) {
                return Container(
                  width: 6.w,
                  height: 6.h,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 3.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? MyColors.appBlack
                        : MyColors.lightGrey,
                  ),
                );
              })),
        ),
      ],
    );
  }

  Widget _yourOrders() {
    return Container(
      decoration: const BoxDecoration(color: MyColors.mainYellow),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 27),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Gotten your\nE-Bike yet?',
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: MyColors.gold,
                letterSpacing: 0.5,
              ),
            ),
            GestureDetector(
              onTap: () {
                pushNewScreen(
                  context,
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                  screen: const YourOrders(),
                );
              },
              child: Container(
                height: 56.h,
                width: 183.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(52),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Your Orders',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SvgPicture.asset('assets/svg/arrow.svg')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _join() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Image.asset(
            'assets/png/bike.gif',
            height: 161.h,
          ),
          Text(
            'You too can join our\nElite squad of E-bikers',
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
