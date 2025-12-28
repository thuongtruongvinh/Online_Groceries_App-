import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/core/extensions/context_extension.dart';
import 'package:groceries_app/presentation/shared/app_button.dart';
import 'package:groceries_app/presentation/shared/app_path.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/shared/app_text_style.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Container _buildBody(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppPath.imgBackgroundOnboarding),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(child: _buildContent(context)),
    );
  }

  Column _buildContent(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.screenHeight * 485 / 896),
        SvgPicture.asset(AppPath.icCarrot),
        SizedBox(height: context.screenHeight * 35 / 896),
        AppText(
          text: 'Welcome\nto our store',
          style: AppTextStyle.tsSemiboldWhite48.copyWith(height: 1.0),
        ),
        SizedBox(height: context.screenHeight * 19 / 896),
        AppText(
          text: 'Ger your groceries in as fast as one hour',
          style: AppTextStyle.tsRegularsoftWhite16,
        ),
        SizedBox(height: context.screenHeight * 40 / 896),
        AppButton(
          text: context.appLocalizations.getStarted,
          onTap: () {
            // Navigator.pushReplacementNamed(context, AppRoutes.singinScreen);
          },
        ),
      ],
    );
  }
}
