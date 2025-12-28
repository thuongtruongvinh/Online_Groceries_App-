import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/core/assets_gen/assets.gen.dart';
import 'package:groceries_app/core/enum/enum.dart';
import 'package:groceries_app/core/extension/context_extension.dart';
import 'package:groceries_app/presentation/shared/app_color.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/shared/app_text_style.dart';

class AppButtonSocial extends StatelessWidget {
  final GestureTapCallback? onTap;
  final SocialButtonType? type;
  const AppButtonSocial({super.key, this.onTap, this.type});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: context.screenHeight * 67 / 896,
        decoration: BoxDecoration(
          color: _buildBackgroundColor(type ?? SocialButtonType.google),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            SizedBox(width: context.screenWidth * 35 / 414),
            _buildIcon(type ?? SocialButtonType.google),
            SizedBox(width: context.screenWidth * 40 / 414),
            _buildText(type ?? SocialButtonType.google),
          ],
        ),
      ),
    );
  }

  Color _buildBackgroundColor(SocialButtonType type) {
    switch (type) {
      case SocialButtonType.google:
        return AppColor.blue;
      case SocialButtonType.facebook:
        return AppColor.steelBlue;
    }
  }

  AppText _buildText(SocialButtonType type) {
    switch (type) {
      case SocialButtonType.google:
        return AppText(
          text: 'Continue with Google',
          style: AppTextStyle.tsSemiboldNearWhite18,
        );
      case SocialButtonType.facebook:
        return AppText(
          text: 'Continue with Facebook',
          style: AppTextStyle.tsSemiboldNearWhite18,
        );
    }
  }

  SvgPicture _buildIcon(SocialButtonType type) {
    switch (type) {
      case SocialButtonType.google:
        return SvgPicture.asset(Assets.icon.icGoogle.path);
      case SocialButtonType.facebook:
        return SvgPicture.asset(Assets.icon.icFacebook.path);
    }
  }
}
