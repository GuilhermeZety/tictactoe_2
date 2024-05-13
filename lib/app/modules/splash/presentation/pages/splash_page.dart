import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/app/core/common/constants/app_assets.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/constants/app_fonts.dart';
import 'package:tictactoe/app/core/common/extensions/widget/text_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              AppAssets.svgs.logo,
              width: 150,
            )
                .animate(
                  onComplete: (controller) => controller.repeat(reverse: true),
                )
                .scaleXY(begin: 0.98, end: 1.02, delay: 500.ms, duration: 1.seconds),
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse('https://github.com/GuilhermeZety'), mode: LaunchMode.externalApplication);
                },
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Desenvolvido por',
                      ),
                      const Text(
                        'Guilherme Martins',
                        style: TextStyle(
                          fontWeight: AppFonts.semiBold,
                          fontSize: 16,
                        ),
                      ).gradient(AppColors.gradient),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ).animate().fade(duration: 0.5.seconds),
    );
  }
}
