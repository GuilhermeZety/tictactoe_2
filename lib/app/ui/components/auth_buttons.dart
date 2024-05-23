import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/app/core/common/enums/auth_platform.dart';
import 'package:tictactoe/app/core/common/extensions/locale_extension.dart';
import 'package:tictactoe/app/core/common/extensions/string_extension.dart';
import 'package:tictactoe/app/ui/components/button.dart';

class AuthButton extends StatelessWidget {
  const AuthButton.google({
    super.key,
    required this.onPressed,
    this.type = AuthPlatform.google,
  });
  const AuthButton.discord({
    super.key,
    required this.onPressed,
    this.type = AuthPlatform.discord,
  });
  const AuthButton.github({
    super.key,
    required this.onPressed,
    this.type = AuthPlatform.github,
  });

  final Future<void> Function()? onPressed;
  final AuthPlatform type;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      color: type.backgroundColor,
      inverted: type.loaderColor,
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
