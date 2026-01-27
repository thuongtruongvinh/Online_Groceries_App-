import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/assets_gen/assets.gen.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/domain/repositories/local_storage_repository.dart';
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
    _timer = Timer(const Duration(seconds: 1), () async {
      if (!mounted) return;
      final accessToken = await getIt<ILocalStorage>().getAccessToken();
      accessToken.fold(
        (failure) {
          context.goNamed(RouteName.onboardingName);
        },
        (data) {
          if (data == null || data.isEmpty) {
            context.goNamed(RouteName.onboardingName);
          } else {
            context.goNamed(RouteName.bottomTabName);
          }
        },
      );
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
