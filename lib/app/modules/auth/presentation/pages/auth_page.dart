import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:signals/signals_flutter.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/constants/app_fonts.dart';
import 'package:tictactoe/app/core/common/constants/app_routes.dart';
import 'package:tictactoe/app/core/common/constants/app_theme.dart';
import 'package:tictactoe/app/core/common/extensions/context_extension.dart';
import 'package:tictactoe/app/core/common/extensions/locale_extension.dart';
import 'package:tictactoe/app/core/common/extensions/string_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget/text_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget/widget_extension.dart';
import 'package:tictactoe/app/core/common/features/usecases/usecase.dart';
import 'package:tictactoe/app/core/common/utils/toasting.dart';
import 'package:tictactoe/app/core/shared/features/auth/domain/usecases/login_with_google.dart';
import 'package:tictactoe/app/core/shared/location_session.dart';
import 'package:tictactoe/app/ui/components/auth_buttons.dart';
import 'package:tictactoe/app/ui/components/switch/language_switch.dart';
import 'package:tictactoe/app/ui/components/switch/theme_switch.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isDarkMode = false;
  bool firstEntry = true;

  @override
  void initState() {
    LocalizatiionSession().locale.listen(context, () {
      if (mounted) setState(() {});
    });

    AppTheme().themeMode.listen(context, () {
      if (mounted) setState(() {});
    });
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(300.ms, () {
        firstEntry = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ThemeSwitch(),
                LanguageSwitch(),
              ],
            ).slideFade(false, active: firstEntry, delay: 200.ms),
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
            ).animate().slideFade(false, active: firstEntry, delay: 300.ms),
            SeparatedColumn(
              separatorBuilder: () => const Gap(12),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${'access_with'.t.capitalize()}:',
                  style: const TextStyle(
                    fontWeight: AppFonts.semiBold,
                  ),
                ).pBottom(4).slideFade(true, active: firstEntry, delay: 600.ms),
                AuthButton.google(
                  onPressed: () => Modular.get<LoginWithGoogle>()(NoParams()).then(
                    (value) => value.fold(
                      (l) => Toasting.error(context, title: l.message),
                      (r) {
                        if (r == true) {
                          Modular.to.pushNamedAndRemoveUntil(AppRoutes.splash, (route) => false);
                        }
                      },
                    ),
                  ),
                ).expandedH().slideFade(true, active: firstEntry, delay: 600.ms),
                AuthButton.discord(
                  onPressed: () async {
                    //
                  },
                ).expandedH().slideFade(true, active: firstEntry, delay: 700.ms),
                AuthButton.github(
                  onPressed: () async {
                    //
                  },
                ).expandedH().slideFade(true, active: firstEntry, delay: 800.ms),
                const Gap(0),
                GestureDetector(
                  onTap: () async {
                    Modular.to.pushNamed(AppRoutes.authGuest);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Text(
                      'access_with_guest'.t.capitalize(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: AppFonts.semiBold,
                      ),
                    ).expandedH().slideFade(true, active: firstEntry, delay: 1000.ms),
                  ),
                ),
              ],
            ),
          ],
        ).p(32).pTop(context.mq.padding.top).pBottom(context.mq.padding.bottom),
      ),
    );
  }
}
