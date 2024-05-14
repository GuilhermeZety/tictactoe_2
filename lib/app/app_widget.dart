import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:signals/signals_flutter.dart';
import 'package:tictactoe/app/core/common/constants/app_locales.dart';
import 'package:tictactoe/app/core/common/constants/app_theme.dart';
import 'package:tictactoe/app/core/common/utils/overlay_ui_utils.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with SignalsAutoDisposeMixin {
  @override
  void initState() {
    OverlayUIUtils.setOverlayStyle(barDark: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['assets/translations'];

    return ThemeProvider(
      initTheme: AppTheme.dark,
      builder: (context, myTheme) {
        return MaterialApp.router(
          title: 'Jogo da Velha',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            LocalJsonLocalization.delegate,
          ],
          supportedLocales: AppLocale().suportedLocales.map((e) => Locale(e.$1, e.$2)),
          locale: AppLocale().locale.watch(context),
          theme: myTheme,
          debugShowCheckedModeBanner: false,
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
        );
      },
    );
  }
}
