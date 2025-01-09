import 'package:dicoding_app_1/ui/pages/coming_soon/coming_soon.dart';
import 'package:dicoding_app_1/ui/pages/home/home_page.dart';
import 'package:dicoding_app_1/ui/pages/splash/splash_page.dart';
import 'package:dicoding_app_1/ui/pages/transaction/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => const SplashPage(),
      );
    case '/home':
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomePage(),
        transitionDuration: 1.5.seconds,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    case '/transaction':
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const TransactionPage(),
        transitionDuration: 1.5.seconds,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    case '/comingsoon':
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ComingSoonPage(),
        transitionDuration: 1.5.seconds,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const SplashPage(),
      );
  }
}
