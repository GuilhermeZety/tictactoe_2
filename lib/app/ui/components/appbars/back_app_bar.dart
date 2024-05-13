import 'dart:io';

import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/extensions/context_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppBar({super.key, this.title, this.suffix, this.backAction, this.backIcon, this.backText, this.animationToTop = true, this.showBackText = false});

  final String? title;
  final Widget? suffix;
  final bool animationToTop;
  final String? backText;
  final Widget? backIcon;
  final Function? backAction;
  final bool showBackText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          Container(
            color: AppColors.primary,
            width: context.width,
          ).animate().slideY(begin: animationToTop ? 0.05 : -0.05, end: 0),
          Positioned(
            top: context.safeArea(AxisDirection.up) + (Platform.isAndroid ? 48 : 36),
            left: 24,
            child: GestureDetector(
              onTap: () {
                if (backAction != null) {
                  backAction!();

                  return;
                }
                Modular.to.pop();
              },
              child: ColoredBox(
                color: Colors.transparent,
                child: Row(
                  children: [
                    ...[
                      backIcon ??
                          const Icon(
                            Icons.keyboard_arrow_left_rounded,
                            color: AppColors.white,
                            size: 30,
                          ),
                      const Gap(5),
                      if (showBackText)
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            backText ?? 'Voltar',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.grey_100,
                            ),
                          ),
                        ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          if (title != null)
            Center(
              child: Text(
                title ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ).pH(24).pTop(context.safeArea(AxisDirection.up) + 12),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, title == null ? 100 : 150);
}
