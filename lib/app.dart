import 'package:flutter/material.dart';
import 'package:prestmit_app/config/routes.dart';
import 'package:prestmit_app/views/splash_screen.dart';
import 'flavors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) =>
          AppRoute.generateRoute(settings),
      home: const SplashScreen(),
    );
  }
}
