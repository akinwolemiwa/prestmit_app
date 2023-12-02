import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prestmit_app/customs/colors.dart';

class DetailsWidget extends StatelessWidget {
  final String text;
  final String subtext;
  const DetailsWidget({super.key, required this.text, required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: MyColors.darkBlue,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          subtext,
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: MyColors.gold,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
