import 'dart:async';

import 'package:flutter/material.dart';
import 'package:groceries_app/core/assets_gen/assets.gen.dart';
import 'package:groceries_app/presentation/shared/app_color.dart';
import 'package:groceries_app/presentation/shared/app_path.dart';
import 'package:groceries_app/presentation/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.mintGreen, body: buildBody());
  }

  Center buildBody() {
    return Center(child: Image.asset(Assets.img.imgLogoAndText.path));
  }
}
