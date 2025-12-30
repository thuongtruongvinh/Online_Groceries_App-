import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/presentation/bloc/bottom_tab/bottom_tab_bloc.dart';
import 'package:groceries_app/presentation/routes/route_name.dart';
import 'package:groceries_app/presentation/screens/Home/home_screen.dart';
import 'package:groceries_app/presentation/screens/auth/signup_screen.dart';
import 'package:groceries_app/presentation/screens/auth/verify_otp_screen.dart';
import 'package:groceries_app/presentation/screens/bottom_tab/bottom_tab.dart';
import 'package:groceries_app/presentation/screens/location/selected_location.dart';
import 'package:groceries_app/presentation/screens/login/login_screen.dart';
import 'package:groceries_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:groceries_app/presentation/screens/splash/splash_screen.dart';

/// A centralized router configuration class for the application using GoRouter.
///
/// This class defines all the navigation routes and their corresponding screens
/// for the grocery app. It uses the GoRouter package for declarative routing
/// and navigation management.
///
/// The router is configured with:
/// - Initial location set to the splash screen
/// - Route definitions with paths, names, and screen builders
///
/// Usage:
/// ```dart
/// MaterialApp.router(
///   routerConfig: AppRouter.router,
/// )
/// ```
class AppRouter {
  static final router = GoRouter(
    initialLocation: RouteName.splashPath,
    routes: [
      GoRoute(
        path: RouteName.homePath,
        name: RouteName.homeName,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: RouteName.selectLocationPath,
        name: RouteName.selectLocationName,
        builder: (context, state) => const SelectLocation(),
      ),
      GoRoute(
        path: RouteName.signupPath,
        name: RouteName.signupName,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: RouteName.verifyOtpPath,
        name: RouteName.verifyOtpName,
        builder: (context, state) => const VerifyOtpScreen(),
      ),
      GoRoute(
        path: RouteName.splashPath,
        name: RouteName.splashName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteName.loginPath,
        name: RouteName.loginName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteName.onboardingPath,
        name: RouteName.onboardingName,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteName.bottomTabPath,
        name: RouteName.bottomTabName,
        builder: (context, state) => BlocProvider(
          create: (context) => BottomTabBloc(),
          child: const BottomTab(),
        ),
      ),
    ],
  );
}
