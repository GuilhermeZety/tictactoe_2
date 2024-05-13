import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/app/core/common/constants/app_assets.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/constants/app_fonts.dart';
import 'package:tictactoe/app/core/common/constants/app_routes.dart';
import 'package:tictactoe/app/core/common/extensions/context_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget/widget_extension.dart';
import 'package:tictactoe/app/ui/components/button.dart';

class NotConnectionPage extends StatefulWidget {
  const NotConnectionPage({super.key});

  @override
  State<NotConnectionPage> createState() => _NotConnectionPageState();
}

class _NotConnectionPageState extends State<NotConnectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        height: context.height,
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Image.asset(
                    AppAssets.svgs.logo,
                    height: 60,
                    color: AppColors.primary,
                  ),
                ).hero('logo'),
                const Gap(50),
                const Text(
                  'Ops!',
                  style: TextStyle(
                    color: AppColors.grey_600,
                    fontSize: 24,
                    fontWeight: AppFonts.bold,
                  ),
                ),
                const Gap(10),
                const Text(
                  'Parece que você está sem conexão com a internet. \n\nVerifique sua conexão e tente novamente.',
                  style: TextStyle(
                    color: AppColors.grey_600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ).expanded(),
            Button(
              onPressed: () async => Modular.to.pushNamedAndRemoveUntil(
                AppRoutes.splash,
                (_) => false,
              ),
              child: const Text('Tentar novamente'),
            ).expandedH(),
          ],
        ),
      ),
    );
  }
}
