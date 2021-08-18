import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show BuildContext, Widget;
import 'package:flutter_auth/app/ui/pages/home/home_page.dart';
import 'package:flutter_auth/app/ui/pages/login/login_page.dart';
import 'package:flutter_auth/app/ui/pages/register/register_page.dart';
import 'package:flutter_auth/app/ui/pages/routes/routes.dart';
import 'package:flutter_auth/app/ui/pages/splash/splash_page.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.SPLASH: (_) => const SplashPage(),
      Routes.LOGIN: (_) => const LoginPage(),
      Routes.REGISTER: (_) => RegisterPage(),
      Routes.HOME: (_) => const HomePage(),
    };
