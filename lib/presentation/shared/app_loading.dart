import 'package:flutter/material.dart';
import 'package:groceries_app/core/assets_gen/assets.gen.dart';
import 'package:lottie/lottie.dart';
class AppLoading extends StatefulWidget {
  const AppLoading({super.key});

  @override
  State<AppLoading> createState() => _AppLoadingState();
}

class _AppLoadingState extends State<AppLoading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        Assets.lotties.loading,
        width: 120,
        height: 120,
        fit: BoxFit.contain,
        repeat: true,
      ),
    );
  }
}