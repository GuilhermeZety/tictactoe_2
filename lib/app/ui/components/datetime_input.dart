import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class DateTimeInput extends StatelessWidget {
  const DateTimeInput({super.key, this.dateTime, required this.label, required this.onChange});

  final DateTime? dateTime;
  final String label;
  final void Function(DateTime?) onChange;

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.grey_600,
          ),
        ).expandedH(),
        const Gap(5),
        GestureDetector(
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: dateTime ?? DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            );
            onChange(picked);
          },
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.grey_100,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            alignment: Alignment.center,
            height: 50,
            child: Text(
              dateTime == null ? 'Sem validade!' : formatter.format(dateTime!),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.grey_500,
              ),
            ),
          ).expandedH(),
        ),
      ],
    );
  }
}
