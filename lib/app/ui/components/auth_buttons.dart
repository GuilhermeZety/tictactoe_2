import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/app/core/common/constants/app_assets.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/extensions/locale_extension.dart';
import 'package:tictactoe/app/core/common/extensions/string_extension.dart';
import 'package:tictactoe/app/ui/components/button.dart';

enum AuthType {
  google,
  discord,
  github;

  Color get backgroundColor {
    return switch (this) {
      AuthType.google => AppColors.grey_100,
      AuthType.discord => const Color(0xFF5865F2),
      AuthType.github => const Color(0xFF2C3236),
    };
  }

  Color get foregroundColor {
    return switch (this) {
      AuthType.google => AppColors.grey_700,
      AuthType.discord => AppColors.grey_200,
      AuthType.github => AppColors.grey_200,
    };
  }

  String get iconSVG {
    return switch (this) {
      AuthType.google => AppAssets.svgs.google,
      AuthType.discord => AppAssets.svgs.discord,
      AuthType.github => AppAssets.svgs.github,
    };
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton.google({
    super.key,
    required this.onPressed,
    this.type = AuthType.google,
  });
  const AuthButton.discord({
    super.key,
    required this.onPressed,
    this.type = AuthType.discord,
  });
  const AuthButton.github({
    super.key,
    required this.onPressed,
    this.type = AuthType.github,
  });

  final Future<void> Function()? onPressed;
  final AuthType type;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      color: type.backgroundColor,
      prefixIcon: SvgPicture.asset(
        type.iconSVG,
        width: 24,
        height: 24,
      ),
      child: Text(
        '${'access_with'.t.capitalize()} ${type.name.capitalize()}',
        style: TextStyle(
          color: type.foregroundColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
