// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/constants/app_fonts.dart';
import 'package:tictactoe/app/core/common/extensions/widget/widget_extension.dart';
import 'package:tictactoe/app/ui/components/panel.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, required this.title, required this.itens});

  final String title;
  final List<MenuItem> itens;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.grey_400,
            fontWeight: AppFonts.bold,
          ),
        ).pLeft(12),
        const Gap(8),
        Panel(
          padding: const EdgeInsets.all(16),
          child: SeparatedColumn(
            separatorBuilder: () => const Gap(8),
            children: itens
                .map(
                  (item) => Material(
                    color: AppColors.grey_100,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: item.onClick,
                      child: Row(
                        children: [
                          item.icon,
                          const Gap(12),
                          Text(
                            item.text,
                            style: const TextStyle(
                              color: AppColors.grey_500,
                              fontWeight: AppFonts.bold,
                            ),
                          ).expanded(),
                          const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 28,
                            color: AppColors.grey_500,
                          ),
                        ],
                      ).p(12),
                    ),
                  ).expandedH(),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class MenuItem {
  final Widget icon;
  final String text;
  final void Function() onClick;
  MenuItem({
    required this.icon,
    required this.text,
    required this.onClick,
  });
}
