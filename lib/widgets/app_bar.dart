import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PAppBar extends StatelessWidget {
  const PAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/png/AVATAR.jpeg'),
            backgroundColor: Colors.transparent,
          ),
          SvgPicture.asset('assets/svg/notif.svg')
        ],
      ),
    );
  }
}
