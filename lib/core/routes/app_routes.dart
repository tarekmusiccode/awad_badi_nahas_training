import 'package:awad_badi_nahas_training/core/routes/page_route_names.dart';
import 'package:awad_badi_nahas_training/features/forget_password/forget_password_screen.dart';
import 'package:awad_badi_nahas_training/features/login/login_screen.dart';
import 'package:awad_badi_nahas_training/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case PageRouteNames.initial:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
          settings: settings
        );
      case PageRouteNames.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
          settings: settings
        );
      case PageRouteNames.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
          settings: settings
        );
      default:
        return MaterialPageRoute(
            builder: (context) => SplashScreen(),
            settings: settings
          );
    }
  }
}
