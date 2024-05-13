import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/constants/app_fonts.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key, this.inverted = true});

  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: inverted ? AppColors.white : AppColors.primary,
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                color: inverted ? AppColors.grey_600 : AppColors.white,
              ),
              const Gap(8),
              Text(
                'Voltar',
                style: TextStyle(
                  color: inverted ? AppColors.grey_600 : AppColors.white,
                  fontWeight: AppFonts.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
