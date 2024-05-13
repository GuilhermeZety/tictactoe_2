// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/app/core/common/constants/app_fonts.dart';
import 'package:tictactoe/app/core/common/extensions/context_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget/widget_extension.dart';
import 'package:tictactoe/app/core/common/utils/toasting.dart';
import 'package:tictactoe/app/core/common/utils/vibrate.dart';
import 'package:tictactoe/app/ui/components/button.dart';
import 'package:tictactoe/app/ui/components/dialogs/custom_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtils {
  static Future<void> to(BuildContext context, String url) async {
    vibrate(FeedbackType.selection);
    var result = await CustomDialog(
      top: Text(
        'Acesso externo',
        style: TextStyle(fontWeight: AppFonts.bold, fontSize: 18, color: context.theme.textTheme.titleLarge!.color),
      ),
      bottom: Column(
        children: [
          Button(
            onPressed: () async => Modular.to.pop(true),
            child: const Text('Confirmar'),
          ).expandedH(),
          const Gap(8),
          Button.secundary(
            onPressed: () async => Modular.to.pop(false),
            child: const Text('Fechar'),
          ).expandedH(),
        ],
      ),
      child: const Text('Voce vai ser redirecionado para fora do aplicativo, deseja continuar?').pV(24),
    ).show(context);
    if (result == true) {
      final success = await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      if (!success) {
        Toasting.warning(context, title: 'Não foi possível acessar, segure para copiar!');
      }
    }
  }
}
