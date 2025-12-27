import 'package:flutter/widgets.dart';
import 'package:groceries_app/presentation/shared/app_color.dart';

class AppTextStyle {
  static const TextStyle tsSemiboldWhite48 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
    fontFamily: 'Gilroy',
  );
  static const TextStyle tsSemiboldBlushWhite18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColor.blushWhite,
    fontFamily: 'Gilroy',
  );
  static final TextStyle tsRegularsoftWhite16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColor.softWhite,
    fontFamily: 'Gilroy',
  );
}
