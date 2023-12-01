import 'package:flutter/material.dart';
import 'package:prestmit_app/views/home_screen.dart';
import 'package:prestmit_app/views/login.dart';
import 'package:prestmit_app/views/splash_screen.dart';

class PageViewTransition<T> extends MaterialPageRoute<T> {
  PageViewTransition({WidgetBuilder? builder, RouteSettings? settings})
      : super(builder: builder!, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == '/') return child;
    if (animation.status == AnimationStatus.reverse) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    }
    return FadeTransition(opacity: animation, child: child);
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget? page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(opacity: animation, child: page),
        );
}

class AppRoute {
  static const String splashscreen = '/splashScreen';
  static const String loginscreen = '/login';
  static const String homescreen = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreen:
        return PageViewTransition(
          builder: (_) => const SplashScreen(),
        );

      case loginscreen:
        return PageViewTransition(
          builder: (_) => const LoginScreen(),
        );

      case homescreen:
        return PageViewTransition(
          builder: (_) => const HomeScreen(),
        );

      default:
        return PageViewTransition(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
