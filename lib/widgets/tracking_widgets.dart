import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prestmit_app/customs/colors.dart';

class TrackingWidgets extends StatefulWidget {
  final Function() onPressed;
  final String text;
  final String subtext;
  final String svgs;

  const TrackingWidgets({
    super.key,
    required this.onPressed,
    required this.text,
    required this.subtext,
    required this.svgs,
  });

  @override
  State<TrackingWidgets> createState() => _TrackingWidgetsState();
}

class _TrackingWidgetsState extends State<TrackingWidgets> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: SizedBox(
        height: 56.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.asset(widget.svgs),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.text,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.darkBlue,
                            letterSpacing: 2.sp,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          widget.subtext,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.darkBlue,
                            letterSpacing: 2.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: MyColors.darkBlue,
                    size: 24.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
