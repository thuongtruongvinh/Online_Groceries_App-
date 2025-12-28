import 'package:flutter/material.dart';
import 'package:groceries_app/core/assets_gen/assets.gen.dart';
import 'package:groceries_app/core/enum/enum.dart';
import 'package:groceries_app/core/extension/context_extension.dart';
import 'package:groceries_app/presentation/routes/app_routes.dart';
import 'package:groceries_app/presentation/shared/app_button_social.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/shared/app_text_field.dart';
import 'package:groceries_app/presentation/shared/app_text_style.dart';
import 'package:groceries_app/presentation/theme/theme.dart';

class SingupScreen extends StatelessWidget {
  const SingupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      body: SingleChildScrollView(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.img.imgVegetables.path),
        SizedBox(height: context.screenHeight * 30 / 896),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 25, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'Get your groceries\nwith nectar',
                style: AppTextStyle.tsSemiBoldNearBlack26,
                textAlign: TextAlign.start,
              ),
              Row(
                children: [
                  AppText(
                    text: 'Are You Aready a member?',
                    style: AppTextStyle.tsSemiboldNeutralGray16,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.loginScreen);
                    },
                    child: AppText(
                      text: 'Sign In',
                      style: AppTextStyle.tsSemiBoldNearBlack18.copyWith(height: 1.0),
                    ),
                  ),
                ],
              ),
              const AppTextField(),
              SizedBox(height: context.screenHeight * 40 / 896),
              Center(
                child: AppText(
                  text: 'Or connect with social media',
                  style: AppTextStyle.tsSemiboldNeutralGray14,
                ),
              ),
              SizedBox(height: context.screenHeight * 37 / 896),
              AppButtonSocial(type: SocialButtonType.google),
              SizedBox(height: context.screenHeight * 20 / 896),
              AppButtonSocial(type: SocialButtonType.facebook),
            ],
          ),
        ),
      ],
    );
  }
}
