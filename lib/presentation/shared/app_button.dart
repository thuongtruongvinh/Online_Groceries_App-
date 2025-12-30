import 'package:flutter/material.dart';
import 'package:groceries_app/core/extensions/context_extension.dart';
import 'package:groceries_app/presentation/shared/app_color.dart';
import 'package:groceries_app/presentation/shared/app_text.dart';
import 'package:groceries_app/presentation/shared/app_text_style.dart';

class AppButton extends StatelessWidget {
  final bool prexixIcon;
  final GestureTapCallback? onTap;
  final Color? color;
  final String text;
  const AppButton({
    super.key,
    this.onTap,
    this.color,
    required this.text,
    this.prexixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.screenHeight * 56 / 896,
        width: context.screenWidth * 364 / 414,
        decoration: BoxDecoration(
          color: color ?? AppColor.mintGreen,
          borderRadius: BorderRadius.circular(19),
        ),
        child: prexixIcon ? Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.exit_to_app, color: AppColor.mintGreen,),
              SizedBox(width: context.screenWidth * 100 / 414),
              AppText(
                text: text,
                style: AppTextStyle.tsSemiBoldmintGreen16,
              ),
            ],
          ),
        ) : Center(
          child: AppText(
            text: text,
            style: AppTextStyle.tsSemiboldBlushWhite18,
          ),
        ),
      ),
    );
  }
}
