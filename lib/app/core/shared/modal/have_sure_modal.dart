import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/app/core/common/extensions/widget_extension.dart';
import 'package:tictactoe/app/core/common/utils/custom_dialog_utils.dart';
import 'package:tictactoe/app/ui/components/button.dart';
import 'package:tictactoe/app/ui/components/dialogs/custom_dialog.dart';

class HaveSureModal extends StatefulWidget {
  const HaveSureModal({
    super.key,
    this.text,
  });

  final String? text;
  Future show(
    BuildContext context,
  ) async {
    return showCustomDialog(
      context,
      child: this,
    );
  }

  @override
  State<HaveSureModal> createState() => _HaveSureModalState();
}

class _HaveSureModalState extends State<HaveSureModal> {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.text != null) ...[
              Text(
                widget.text!,
                textAlign: TextAlign.center,
              ),
              const Gap(24),
            ],
          ],
        ),
      ),
    );
  }
}
