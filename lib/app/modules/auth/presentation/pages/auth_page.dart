import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/constants/app_fonts.dart';
import 'package:tictactoe/app/core/common/constants/app_theme.dart';
import 'package:tictactoe/app/core/common/extensions/locale_extension.dart';
import 'package:tictactoe/app/core/common/extensions/string_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget/text_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget/widget_extension.dart';
import 'package:tictactoe/app/core/shared/location_session.dart';
import 'package:tictactoe/app/ui/components/auth_buttons.dart';
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
    LocalizatiionSession().locale.listen(context, () {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LanguageSwitch(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'wellcome'.t,
                    style: const TextStyle(fontSize: 42, fontWeight: AppFonts.bold, letterSpacing: 1),
                  ).gradient(AppColors.gradient),
                  const Gap(30),
                  Text.rich(
                    TextSpan(
                      text: '${'auth_before_1'.t}\n',
                      children: [
                        TextSpan(
                          text: '${'auth_before_2'.t}\n',
                        ),
                        TextSpan(
                          text: '${'account'.t.capitalize()} ',
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: AppFonts.bold,
                          ),
                        ),
                        TextSpan(
                          text: '${'auth_before_3'.t} ',
                        ),
                        TextSpan(
                          text: 'guest'.t.capitalize(),
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: AppFonts.bold,
                          ),
                        ),
                        const TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                    style: const TextStyle(
                      fontWeight: AppFonts.semiBold,
                      fontSize: 16,
                      color: AppColors.grey_400,
                    ),
                  ),
                ],
              ),
              SeparatedColumn(
                separatorBuilder: () => const Gap(12),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${'access_with'.t.capitalize()}:',
                    style: const TextStyle(
                      fontWeight: AppFonts.semiBold,
                    ),
                  ).pBottom(4),
                  ThemeSwitcher.switcher(
                    builder: (context, switcher) => AuthButton.google(
                      onPressed: () async {
                        AppTheme().invertThemeMode();
                        switcher.changeTheme(
                          theme: AppTheme().themeMode.value == ThemeMode.dark ? ThemeData.light() : AppTheme.dark,
                        );
                      },
                    ).expandedH(),
                  ),
                  AuthButton.discord(
                    onPressed: () async {},
                  ).expandedH(),
                  AuthButton.github(
                    onPressed: () async {},
                  ).expandedH(),
                  const Gap(0),
                  Text(
                    'access_with_guest'.t.capitalize(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: AppFonts.semiBold,
                    ),
                  ).expandedH(),
                ],
              ),
            ],
          ).p(32),
        ),
      ),
    );
  }
}
