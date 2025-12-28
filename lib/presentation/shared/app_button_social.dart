import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/core/assets_gen/assets.gen.dart';
import 'package:groceries_app/core/enums/social.dart';
import 'package:groceries_app/core/extensions/context_extension.dart';
import 'package:groceries_app/presentation/shared/app_color.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/shared/app_text_style.dart';

class AppButtonSocial extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Social? type;
  const AppButtonSocial({super.key, this.onTap, this.type});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: context.screenHeight * 67 / 896,
        decoration: BoxDecoration(
          color: _buildBackgroundColor(type ?? Social.google),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            SizedBox(width: context.screenWidth * 35 / 414),
            _buildIcon(type ?? Social.google),
            SizedBox(width: context.screenWidth * 40 / 414),
            _buildText(type ?? Social.google),
          ],
        ),
      ),
    );
  }

  Color _buildBackgroundColor(Social type) {
    switch (type) {
      case Social.google:
        return AppColor.blue;
      case Social.facebook:
        return AppColor.steelBlue;
    }
  }

  AppText _buildText(Social type) {
    switch (type) {
      case Social.google:
        return AppText(
          text: 'Continue with Google',
          style: AppTextStyle.tsSemiboldNearWhite18,
        );
      case Social.facebook:
        return AppText(
          text: 'Continue with Facebook',
          style: AppTextStyle.tsSemiboldNearWhite18,
        );
    }
  }

  SvgPicture _buildIcon(Social type) {
    switch (type) {
      case Social.google:
        return SvgPicture.asset(Assets.icon.icGoogle.path);
      case Social.facebook:
        return SvgPicture.asset(Assets.icon.icFacebook.path);
    }
  }
}