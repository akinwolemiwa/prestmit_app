import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prestmit_app/customs/colors.dart';
import 'package:prestmit_app/widgets/details_widget.dart';
import 'package:prestmit_app/widgets/history_widget.dart';

class TrackingDetails extends StatelessWidget {
  const TrackingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F6FB),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return Stack(
      children: [
        SizedBox(
          width: 375.w,
          child: SvgPicture.asset('assets/svg/map.svg', fit: BoxFit.fitWidth),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 24, right: 24),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      color: MyColors.darkBlue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Text(
                      'Tracking Details',
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: MyColors.darkBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h),
            _trackId(),
          ],
        ),
        _sheet()
      ],
    );
  }

  Widget _trackId() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 88.h,
            width: 327.w,
            decoration: BoxDecoration(
              color: MyColors.mainYellow,
              borderRadius: BorderRadius.circular(46),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 85),
            height: 56.h,
            width: 295.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(52),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'SCP9283764526',
                style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: MyColors.darkBlue,
                    letterSpacing: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.15,
      minChildSize: 0.15,
      maxChildSize: 0.85,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 24),
                      child: SvgPicture.asset('assets/svg/line.svg'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estimate arrives in',
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: MyColors.grey2,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              '2h 40m',
                              style: GoogleFonts.inter(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                color: MyColors.darkBlue,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset('assets/svg/dots.svg')
                      ],
                    ),
                    SizedBox(height: 30.h),
                    _details(),
                    SizedBox(height: 24.h),
                    _history(),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _details() {
    return Container(
      width: 327.w,
      decoration: BoxDecoration(
        color: MyColors.mainYellow,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsWidget(
              text: 'Sukabumi, Indonesia',
              subtext: 'No receipt : SCP7356382982'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: Color(0xffedc127)),
          ),
          DetailsWidget(text: '2,500 USD', subtext: 'Postal Fee'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: Color(0xffedc127)),
          ),
          DetailsWidget(text: 'Bali, Indonesia', subtext: 'Parcel, 24kg'),
        ],
      ),
    );
  }

  Widget _history() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'History',
          style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: MyColors.darkBlue,
              letterSpacing: 0.5),
        ),
        SizedBox(height: 24.h),
        const HistoryWidget(
          image: 'assets/png/his1.png',
          text: 'In Delivery',
          subtext: 'Bali, Indonesia',
          time: '00.00 PM',
        ),
        SizedBox(height: 35.h),
        const HistoryWidget(
          image: 'assets/png/his2.png',
          text: 'In Delivery',
          subtext: 'Jakarta, Indonesia',
          time: '21.00 PM',
        ),
        SizedBox(height: 35.h),
        const HistoryWidget(
          image: 'assets/png/his3.png',
          text: 'Send Form Sukabumi',
          subtext: 'Sukabumi, Indonesia',
          time: '19.00 PM',
        ),
        SizedBox(height: 35.h),
      ],
    );
  }
}
