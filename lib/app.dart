import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/di/injector.dart';
import 'package:groceries_app/domain/core/app_logger.dart';
import 'package:groceries_app/domain/usecase/get_locale_usecase.dart';
import 'package:groceries_app/domain/usecase/set_locale_usecase.dart';
import 'package:groceries_app/l10n/app_localizations.dart';
import 'package:groceries_app/presentation/routes/app_router.dart';
import 'package:groceries_app/presentation/screens/locale/locale_bloc.dart';
import 'package:groceries_app/presentation/screens/locale/locale_state.dart';

/// code phải dễ đọc, dễ hiểu, dễ mở rộng, dễ bảo trì, dễ tái sử dụng, sau kiểm thử

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleBloc(
        getIt<GetLocaleUsecase>(),
        getIt<SetLocaleUsecase>(),
        getIt<AppLogger>(),
      ),
      child: const MyAppBody(),
    );
  }
}

class MyAppBody extends StatelessWidget {
  const MyAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          routerConfig: AppRouter.router,
          locale: state.isVietnamese
              ? Locale('vi', 'VN')
              : const Locale('en', 'US'),
          supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
        );
      },
    );
  }
}
