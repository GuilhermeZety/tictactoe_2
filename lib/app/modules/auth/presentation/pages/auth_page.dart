import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:tictactoe/app/core/common/constants/app_locales.dart';
import 'package:tictactoe/app/core/common/extensions/locale_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget/widget_extension.dart';
import 'package:tictactoe/app/ui/components/language_switch.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isDarkMode = false;

  @override
  void initState() {
    AppLocale().locale.listen(context, () {
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LanguageSwitch(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('hello'.t),
                ],
              ).expanded(),
            ],
          ).p(32),
        ),
      ),
    );
  }
}
