import 'package:flutter/material.dart';
import 'package:groceries_app/l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  /// app localizations
  AppLocalizations get localizations => AppLocalizations.of(this);
}
