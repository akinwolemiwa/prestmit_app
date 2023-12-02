import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:prestmit_app/customs/colors.dart';
import 'package:prestmit_app/views/home/tracking_details.dart';
import 'package:prestmit_app/widgets/tracking_widgets.dart';

class YourOrders extends StatelessWidget {
  const YourOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
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
          _package(),
          _trackingHistory(context)
        ],
      ),
    );
  }

  Widget _package() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.mainYellow,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0.h,
              top: 0.h,
              child: SvgPicture.asset('assets/svg/lines.svg'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Track your Package',
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: MyColors.appBlack,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Enter the receipt number that has\nbeen given by the officer',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                      color: MyColors.gold,
                    ),
                  ),
                  SizedBox(height: 29.h),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    height: 56.h,
                    width: 279.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(52),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter receipt number',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    height: 56.h,
                    width: 279.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(52),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Track Now',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _trackingHistory(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Text(
            'Tracking history',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: MyColors.darkBlue,
            ),
          ),
          SizedBox(height: 16.h),
          TrackingWidgets(
            onPressed: () {
              pushNewScreen(
                context,
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.fade,
                screen: const TrackingDetails(),
              );
            },
            text: 'SCP9283764526',
            subtext: 'In the process',
            svgs: 'assets/png/process.png',
          ),
          SizedBox(height: 24.h),
          TrackingWidgets(
            onPressed: () {},
            text: 'SCP2874093726',
            subtext: 'In delivery',
            svgs: 'assets/png/delivery.png',
          )
        ],
      ),
    );
  }
}
