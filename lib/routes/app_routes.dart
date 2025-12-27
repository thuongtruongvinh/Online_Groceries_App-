import 'package:flutter/material.dart';
import 'package:groceries_app/screens/auth/singin_screen.dart';
import 'package:groceries_app/screens/onboarding/onboarding_screen.dart';
import 'package:groceries_app/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String onboardingScreen = '/onboarding';
  static const String singinScreen = '/singin';

  Map<String, Widget Function(BuildContext context)> routes = {
    AppRoutes.splashScreen: (context) => const SplashScreen(),
    AppRoutes.onboardingScreen: (context) => const OnboardingScreen(),
    AppRoutes.singinScreen: (context) => const SinginScreen(),
  };
}
