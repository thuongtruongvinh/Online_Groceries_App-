import 'package:flutter/material.dart';
import 'package:groceries_app/l10n/app_localizations.dart';
import 'package:groceries_app/presentation/routes/app_routes.dart';

/// code phải dễ đọc, dễ hiểu, dễ mở rộng, dễ bảo trì, dễ tái sử dụng, sau kiểm thử

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes().routes,
    );
  }
}
