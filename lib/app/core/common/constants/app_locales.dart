import 'dart:ui';

import 'package:signals/signals.dart';

class AppLocale {
  //SingleTon
  AppLocale._();
  static final AppLocale _instance = AppLocale._();
  factory AppLocale() => AppLocale._instance;
  //

  final List<(String, String)> suportedLocales = [
    ('en', 'US'),
    ('pt', 'BR'),
    ('es', 'ES'),
  ];
  final locale = const Locale('pt').toSignal();

  void switchLocale() {
    switch (locale.value.languageCode) {
      case 'pt':
        locale.value = const Locale('en', 'US');
        break;
      case 'en':
        locale.value = const Locale('es', 'ES');
        break;
      case 'es':
        locale.value = const Locale('pt', 'BR');
        break;
    }
  }
}
