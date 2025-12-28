import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/screens/auth/login_screen.dart';
import 'package:groceries_app/presentation/screens/auth/singup_screen.dart';
import 'package:groceries_app/presentation/screens/auth/verify_otp_screen.dart';
import 'package:groceries_app/presentation/screens/home/home_screen.dart';
import 'package:groceries_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:groceries_app/presentation/screens/select_location/select_location.dart';
import 'package:groceries_app/presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String onboardingScreen = '/onboarding';
  static const String singinScreen = '/singin';
  static const String verifyOtpScreen = '/verify-otp';
  static const String selectLocationScreen = '/select-location';
  static const String loginScreen = '/login';
  static const String homeScreen = '/home';

  Map<String, Widget Function(BuildContext context)> routes = {
    AppRoutes.splashScreen: (context) => const SplashScreen(),
    AppRoutes.onboardingScreen: (context) => const OnboardingScreen(),
    AppRoutes.singinScreen: (context) => const SingupScreen(),
    AppRoutes.verifyOtpScreen: (context) => const VerifyOtpScreen(),
    AppRoutes.selectLocationScreen: (context) => const SelectLocation(),
    AppRoutes.loginScreen: (context) => const LoginScreen(),
    AppRoutes.homeScreen: (context) => const HomeScreen(),
  };
}
