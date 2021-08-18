import 'package:flutter/material.dart';
import 'package:flutter_auth/app/ui/pages/routes/app_routes.dart';
import 'package:flutter_auth/app/ui/pages/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FA Meedu',
      navigatorKey: router.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      routes: appRoutes,
      navigatorObservers: [
        router.observer,
      ],
    );
  }
}
