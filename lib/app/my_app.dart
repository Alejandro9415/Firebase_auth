import 'package:flutter/material.dart';
import 'package:flutter_auth/app/ui/global_controller/theme_controller.dart';
import 'package:flutter_auth/app/ui/pages/routes/app_routes.dart';
import 'package:flutter_auth/app/ui/pages/routes/routes.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/router.dart' as router;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, __) {
        final theme = watch(themeProvider);
        return MaterialApp(
          key: router.appKey,
          title: 'Flutter FA Meedu',
          navigatorKey: router.navigatorKey,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.SPLASH,
          darkTheme: theme.darkTheme,
          theme: theme.ligthTheme,
          themeMode: theme.mode,
          routes: appRoutes,
          navigatorObservers: [
            router.observer,
          ],
        );
      },
    );
  }
}
