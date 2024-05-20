import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/constants/app_fonts.dart';
import 'package:tictactoe/app/core/common/extensions/locale_extension.dart';
import 'package:tictactoe/app/core/common/extensions/string_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget/text_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget/widget_extension.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(),
      body: SafeArea(
        bottom: true,
        top: false,
        child: SubScaffold(
          bottom: Button(
            onPressed: () async {},
            suffixIcon: const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 24,
              color: AppColors.white,
            ),
            child: const Text(
              'Acessar como convidado',
            ),
          ).p(32),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              ).animate().slideFade(false, active: true, delay: 200.ms),
              const Gap(100),
              Input(
                TextEditingController(),
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
