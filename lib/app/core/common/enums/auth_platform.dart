import 'package:flutter/material.dart';
import 'package:tictactoe/app/core/common/constants/app_assets.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';

enum AuthPlatform {
  google,
  discord,
  github;

  Color get backgroundColor {
    return switch (this) {
      AuthPlatform.google => AppColors.grey_100,
      AuthPlatform.discord => const Color(0xFF5865F2),
      AuthPlatform.github => const Color(0xFF2C3236),
    };
  }

  Color get foregroundColor {
    return switch (this) {
      AuthPlatform.google => AppColors.grey_700,
      AuthPlatform.discord => AppColors.grey_100,
      AuthPlatform.github => AppColors.grey_200,
    };
  }

  String get iconSVG {
    return switch (this) {
      AuthPlatform.google => AppAssets.svgs.google,
      AuthPlatform.discord => AppAssets.svgs.discord,
      AuthPlatform.github => AppAssets.svgs.github,
    };
  }
}
