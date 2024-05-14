import 'package:localization/localization.dart';

extension LocaleExtension on String {
  String get t => i18n();
}
