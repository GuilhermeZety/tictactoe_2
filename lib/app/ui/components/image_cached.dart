import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/extensions/widget/widget_extension.dart';

class ImageCached extends StatelessWidget {
  const ImageCached({
    super.key,
    required this.url,
    this.radius,
    this.file,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.shadow = false,
    this.transparent = false,
  });

  final String? url;
  final double? radius;
  final File? file;
  final BoxFit fit;
  final double? width;
  final double? height;
  final bool shadow;
  final bool transparent;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 10),
            boxShadow: shadow
                ? [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(3, 3), // changes position of shadow
                    ),
                  ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 10),
            child: Builder(
              builder: (context) {
                if (file != null) {
                  return Image.file(
                    file!,
                    fit: fit,
                    width: width,
                    height: height,
                  );
                }
                return CachedNetworkImage(
                  imageUrl: url ?? '',
                  placeholder: (context, url) => Container(
                    constraints: constraints,
                    color: AppColors.grey_200,
                  ).shim(),
                  errorWidget: (context, url, error) => Container(
                    constraints: constraints,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius ?? 10),
                      color: transparent ? Colors.white.withOpacity(0.1) : AppColors.grey_300,
                    ),
                    child: transparent
                        ? null
                        : const Center(
                            child: Text(
                              'SEM\nIMAGEM',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.grey_500,
                                fontSize: 8,
                              ),
                            ),
                          ),
                  ),
                  fit: fit,
                  width: width,
                  height: height,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
