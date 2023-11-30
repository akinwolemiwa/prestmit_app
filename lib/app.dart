import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prestmit_app/config/routes.dart';
import 'package:prestmit_app/views/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'flavors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: F.title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (RouteSettings settings) =>
            AppRoute.generateRoute(settings),
        home: const SplashScreen(),
      ),
    );
  }
}
