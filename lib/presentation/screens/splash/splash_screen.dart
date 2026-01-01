import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/assets_gen/assets.gen.dart';
import 'package:groceries_app/presentation/routes/route_name.dart';
import 'package:groceries_app/presentation/shared/app_color.dart';

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
      if (!mounted) return;
      context.goNamed(RouteName.onboardingName);
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
