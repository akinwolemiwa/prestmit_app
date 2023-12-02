import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prestmit_app/customs/colors.dart';

class HistoryWidget extends StatelessWidget {
  final String image;
  final String text;
  final String subtext;
  final String time;
  const HistoryWidget(
      {super.key,
      required this.image,
      required this.text,
      required this.subtext,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              height: 56.h,
              width: 56.w,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: MyColors.darkBlue,
                        letterSpacing: 0.5),
                  ),
                  Text(
                    subtext,
                    style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey2,
                        letterSpacing: 0.5),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          time,
          style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.grey2,
              letterSpacing: 0.5),
        ),
      ],
    );
  }
}
