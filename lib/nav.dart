// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:prestmit_app/customs/colors.dart';
import 'package:prestmit_app/views/cart.dart';
import 'package:prestmit_app/views/home/home_screen.dart';
import 'package:prestmit_app/views/markey.dart';
import 'package:prestmit_app/views/settings.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _NavScreens() {
    return [
      const HomeScreen(),
      const MarkeyView(),
      const CartView(),
      const SettingsView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/svg/home_icon.svg'),
        inactiveIcon: SvgPicture.asset('assets/svg/home_inactive.svg'),
        title: (" "),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/svg/markey_active.svg'),
        inactiveIcon: SvgPicture.asset('assets/svg/markey_inactive.svg'),
        title: (" "),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/svg/cart_active.svg'),
        inactiveIcon: SvgPicture.asset('assets/svg/cart_inactive.svg'),
        title: (" "),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/svg/settings_active.svg'),
        inactiveIcon: SvgPicture.asset('assets/svg/settings_inactive.svg'),
        title: (" "),
      ),
      // PersistentBottomNavBarItem(
      //   icon: const Icon(
      //     CustomIcons.activity,
      //     size: 24,
      //   ),
      //   title: ("kkkk"),
      //   activeColorPrimary: Colors.black,
      //   inactiveColorPrimary: MyColors.lightGrey,
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PersistentTabView(
        context,
        screens: _NavScreens(),
        items: _navBarsItems(),
        controller: _controller,
        backgroundColor: MyColors.navGrey,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style6,
        navBarHeight: 80.h,
      ),
    );
  }
}
