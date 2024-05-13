import 'package:flutter/material.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/extensions/context_extension.dart';
import 'package:tictactoe/app/core/common/extensions/widget/widget_extension.dart';
import 'package:tictactoe/app/core/shared/modal/logout_modal.dart';
import 'package:tictactoe/app/ui/components/image_cached.dart';

class LogoutAppBar extends StatelessWidget {
  const LogoutAppBar({super.key, required this.photo, this.showPhoto = true});

  final String? photo;
  final bool showPhoto;

  @override
  Widget build(BuildContext context) {
    double topSafeArea = context.safeArea(AxisDirection.up);
    return SizedBox(
      height: 150 + (showPhoto ? (125 / 2) : 0),
      child: Stack(
        children: [
          Container(
            width: context.width,
            height: 150,
            color: AppColors.primary,
          ).hero('primary_back'),
          Positioned(
            top: 48 + topSafeArea / 2,
            right: 24,
            child: IconButton(
              icon: const Icon(
                Icons.logout,
                color: AppColors.white,
                size: 30,
              ),
              onPressed: () {
                LogoutModal.show(context);
              },
            ),
          ),
          if (showPhoto)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageCached(
                    shadow: true,
                    url: photo,
                    width: 125,
                    height: 125,
                    radius: 1000,
                  ).hero('consumer_photo').slideFade(false, fadeInit: 0.5),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
