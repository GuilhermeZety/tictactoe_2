import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/constants/app_fonts.dart';
import 'package:tictactoe/app/core/common/constants/app_routes.dart';
import 'package:tictactoe/app/core/common/extensions/context_extension.dart';
import 'package:tictactoe/app/core/common/extensions/locale_extension.dart';
import 'package:tictactoe/app/core/common/extensions/string_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget/text_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget/widget_extension.dart';
import 'package:tictactoe/app/core/shared/features/auth/domain/usecases/login_anonymous.dart';
import 'package:tictactoe/app/ui/components/appbars/back_app_bar.dart';
import 'package:tictactoe/app/ui/components/button.dart';
import 'package:tictactoe/app/ui/components/input.dart';
import 'package:tictactoe/app/ui/components/subscaffold.dart';

class GuestAccessPage extends StatefulWidget {
  const GuestAccessPage({super.key});

  @override
  State<GuestAccessPage> createState() => _GuestAccessPageState();
}

class _GuestAccessPageState extends State<GuestAccessPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(),
      body: SafeArea(
        bottom: true,
        top: false,
        child: SubScaffold(
          bottom: Button(
            onPressed: () async {
              //
              var resp = await Modular.get<LoginAnonymous>()(
                LoginAnonymousParams(
                  name: controller.text,
                ),
              );
              if (resp.isRight()) {
                Modular.to.pushNamedAndRemoveUntil(AppRoutes.splash, (route) => false);
              }
            },
            suffixIcon: const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 24,
              color: AppColors.white,
            ),
            child: Text(
              'access_with_guest'.t.capitalize(),
            ),
          ).p(32),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'guest'.t.capitalize(),
                    style: const TextStyle(fontSize: 42, fontWeight: AppFonts.bold, letterSpacing: 1),
                  ).gradient(AppColors.gradient),
                  const Gap(30),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Text(
                      'Para acessar como convidado, digite seu nome ou nickname para seu amigo lhe identificar.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: AppFonts.semiBold,
                        color: context.textTheme.bodySmall?.color,
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: const Text(
                      '(caso não insira o seu nome vai ser definido para ”Anônimo”)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: AppFonts.semiBold,
                        color: AppColors.grey_500,
                      ),
                    ),
                  ),
                ],
              ).animate().slideFade(false, active: true, delay: 200.ms).pTop(30),
              const Gap(100),
              Input(
                controller,
                label: 'Nome:',
                hint: 'Anônimo',
              ),
            ],
          ).p(32),
        ),
      ),
    );
  }
}
