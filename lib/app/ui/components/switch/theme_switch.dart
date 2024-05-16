import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/constants/app_theme.dart';
import 'package:tictactoe/app/core/common/extensions/widget/widget_extension.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  ThemeMode themeMode = ThemeMode.light;
  double width = 70;
  double height = 35;

  @override
  void initState() {
    themeMode = AppTheme().themeMode.value;
    effect(() {
      var value = AppTheme().themeMode.value;
      if (value != themeMode) {
        changeTheme(value);
      }
    });
    super.initState();
  }

  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher.switcher(
      builder: (context, switcher) => GestureDetector(
        onTap: () {
          switcher.changeTheme(
            theme: AppTheme().themeMode.value == ThemeMode.dark ? ThemeData.light() : AppTheme.dark,
          );
          AppTheme().invertThemeMode();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: themeMode == ThemeMode.light ? Colors.white : AppColors.blue_600,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: themeMode == ThemeMode.light ? Colors.black.withOpacity(0.1) : Colors.black.withOpacity(0.0),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: (width / 2) - 4,
                height: (width / 2) - 4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      if (themeMode == ThemeMode.light) ...[
                        const Color(0xFFFFD8A5),
                        const Color(0xFFE3A049),
                      ] else ...[
                        const Color(0xFF262674),
                        const Color(0xFF6D45F5),
                      ],
                    ],
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  themeMode == ThemeMode.light ? Icons.sunny : Icons.dark_mode,
                  color: AppColors.white,
                ),
              ).pLeft(themeMode == ThemeMode.dark ? 2 : width / 2),
            ],
          ),
        ),
      ),
    );
  }
}
