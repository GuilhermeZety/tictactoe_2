// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/extensions/widget_extension.dart';
import 'package:tictactoe/app/core/common/utils/custom_dialog_utils.dart';
import 'package:tictactoe/app/ui/components/button.dart';
import 'package:tictactoe/app/ui/components/dialogs/custom_dialog.dart';

class SelectPhotoModal extends StatefulWidget {
  const SelectPhotoModal({super.key});

  static Future<File?> show(BuildContext context) {
    return showCustomDialog<File>(
      context,
      child: CustomDialog(
        top: const Text(
          'Selecione uma imagem',
          style: TextStyle(
            color: AppColors.grey_600,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        bottom: Button.secundary(
          child: const Text(
            'Voltar',
          ),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ).expandedH(),
        child: const SelectPhotoModal(),
      ),
    );
  }

  @override
  State<SelectPhotoModal> createState() => _SelectPhotoModalState();
}

class _SelectPhotoModalState extends State<SelectPhotoModal> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(30),
          Button(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.camera_alt,
                ),
                Text(
                  'Camera',
                ),
                Gap(24),
              ],
            ),
            onPressed: () async {
              XFile? value = await ImagePicker().pickImage(source: ImageSource.camera, maxWidth: 1000, maxHeight: 1000, imageQuality: 70);
              if (value != null) {
                Navigator.of(context).pop(File(value.path));
              }
            },
          ).expandedH(),
          const Gap(2),
          const Text(
            'Ao selecionar esta opção, você será redirecionado para sua câmera',
            style: TextStyle(
              color: AppColors.grey_500,
              fontSize: 12,
            ),
          ),
          const Gap(10),
          Button(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.image,
                ),
                Text(
                  'Galeria',
                ),
                Gap(24),
              ],
            ),
            onPressed: () async {
              XFile? value = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxWidth: 1000,
                maxHeight: 1000,
                imageQuality: 70,
              );
              if (value != null) {
                Navigator.of(context).pop(File(value.path));
              }
            },
          ).expandedH(),
          const Gap(2),
          const Text(
            'Ao selecionar esta opção, você será redirecionado para sua galeria',
            style: TextStyle(
              color: AppColors.grey_500,
              fontSize: 12,
            ),
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
