import 'package:flutter/material.dart';
import 'package:tictactoe/app/core/common/constants/app_theme.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () {
            //
            AppTheme().themeMode.value = AppTheme().themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
          },
          child: const Text('change theme'),
        ),
      ),
    );
  }
}
