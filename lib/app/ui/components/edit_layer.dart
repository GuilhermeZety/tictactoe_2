import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EditLayer extends StatelessWidget {
  const EditLayer({
    super.key,
    required this.onTap,
    required this.width,
    required this.height,
    required this.child,
    this.inverted = false,
    this.alignment = Alignment.bottomRight,
    this.padding,
  });

  final void Function() onTap;
  final Widget child;
  final double width;
  final double height;
  final bool inverted;
  final Alignment alignment;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          child,
          Align(
            alignment: alignment,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  color: inverted ? AppColors.white : AppColors.primary,
                  borderRadius: BorderRadius.circular(1000),
                ),
                margin: padding,
                width: 40,
                height: 40,
                child: Icon(
                  Icons.edit_rounded,
                  color: inverted ? AppColors.primary : AppColors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
