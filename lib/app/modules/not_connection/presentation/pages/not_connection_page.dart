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
                  child: SvgPicture.asset(
                    AppAssets.svgs.logo,
                    height: 60,
                  ),
                ).hero('logo'),
                const Gap(50),
                Text(
                  'Ops!',
                  style: TextStyle(
                    color: context.textTheme.titleLarge!.color,
                    fontSize: 24,
                    fontWeight: AppFonts.bold,
                  ),
                ),
                const Gap(10),
                Text(
                  'Parece que você está sem conexão com a internet. \n\nVerifique sua conexão e tente novamente.',
                  style: TextStyle(
                    color: context.textTheme.titleMedium!.color,
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
