import 'package:flutter/material.dart';
import 'package:groceries_app/components/app_color.dart';
import 'package:groceries_app/components/app_text.dart';
import 'package:groceries_app/components/app_text_style.dart';
import 'package:groceries_app/core/extension/context_extension.dart';

class AppButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String text;
  const AppButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.screenHeight * 56 / 896,
        width: context.screenWidth * 364 / 414,
        decoration: BoxDecoration(
          color: AppColor.mintGreen,
          borderRadius: BorderRadius.circular(19),
        ),
        child: Center(
          child: AppText(
            text: text,
            style: AppTextStyle.tsSemiboldBlushWhite18,
          ),
        ),
      ),
    );
  }
}
