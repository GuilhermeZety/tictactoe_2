import 'dart:ui';

import 'package:signals/signals.dart';

class AppLocale {
  //SingleTon
  AppLocale._();
  static final AppLocale _instance = AppLocale._();
  factory AppLocale() => AppLocale._instance;
  //

  final List<String> suportedLocales = [
    'en',
    'es',
    'pt',
  ];
  final locale = const Locale('pt').toSignal();
}
