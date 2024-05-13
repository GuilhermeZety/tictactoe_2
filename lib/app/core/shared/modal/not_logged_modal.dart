import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/app/core/common/extensions/widget_extension.dart';
import 'package:tictactoe/app/core/common/utils/custom_dialog_utils.dart';
import 'package:tictactoe/app/ui/components/button.dart';
import 'package:tictactoe/app/ui/components/dialogs/custom_dialog.dart';

class NotLoggedModal extends StatefulWidget {
  const NotLoggedModal({
    super.key,
  });

  static Future show(
    BuildContext context,
  ) async {
    return showCustomDialog(
      context,
      child: const NotLoggedModal(),
    );
  }

  @override
  State<NotLoggedModal> createState() => _NotLoggedModalState();
}

class _NotLoggedModalState extends State<NotLoggedModal> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      top: const Text(
        'Voce precisa estar logado!',
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
              Navigator.pop(context, true);
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
              'Para acessar este recurso, você deve estar logado.',
              textAlign: TextAlign.center,
            ),
            Gap(24),
          ],
        ),
      ),
    );
  }
}
