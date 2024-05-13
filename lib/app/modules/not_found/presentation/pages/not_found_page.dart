import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/app/core/common/constants/app_assets.dart';
import 'package:tictactoe/app/core/common/constants/app_fonts.dart';
import 'package:tictactoe/app/core/common/constants/app_routes.dart';
import 'package:tictactoe/app/core/common/extensions/context_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget/widget_extension.dart';
import 'package:tictactoe/app/ui/components/button.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Gap(10),
                Column(
                  children: [
                    Container(
                      width: context.width - 40,
                      height: context.width - 40,
                      constraints: const BoxConstraints(maxWidth: 300, maxHeight: 300),
                      child: SvgPicture.asset(AppAssets.svgs.notFound),
                    ),
                    const Text(
                      'Página não encontrada!',
                      style: TextStyle(fontWeight: AppFonts.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(10),
                    const Text(
                      'Esta página não existe ou foi removida. Verifique o endereço digitado ou volte para a página inicial.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Button(
                  onPressed: () async => Modular.to.pushNamedAndRemoveUntil(
                    AppRoutes.splash,
                    (_) => false,
                  ),
                  child: const Text('VOLTAR PARA A TELA INICIAL'),
                ).expandedH(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
