import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/app/core/common/extensions/widget_extension.dart';
import 'package:tictactoe/app/core/common/utils/custom_dialog_utils.dart';
import 'package:tictactoe/app/ui/components/button.dart';
import 'package:tictactoe/app/ui/components/dialogs/custom_dialog.dart';

class LogoutModal extends StatefulWidget {
  const LogoutModal({
    super.key,
  });

  static Future show(
    BuildContext context,
  ) async {
    return showCustomDialog(
      context,
      child: const LogoutModal(),
    );
  }

  @override
  State<LogoutModal> createState() => _LogoutModalState();
}

class _LogoutModalState extends State<LogoutModal> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      top: const Text(
        'Tem Certeza?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: Column(
        children: [
          Button(
            onPressed: () async {
              // await session.logout();
              log('LOGOUT');
            },
            child: const Text('Confirmar'),
          ).expandedH(),
          const Gap(8),
          Button.secundary(
            onPressed: () async {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ).expandedH(),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tem certeza que deseja encerrar a sua sessão?',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
