import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signals/signals_flutter.dart';
import 'package:tictactoe/app/core/common/constants/app_assets.dart';
import 'package:tictactoe/app/core/shared/location_session.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> with SignalsAutoDisposeMixin {
  final currentLanguageSVG = computed(
    () {
      switch (LocalizatiionSession().locale.value.languageCode) {
        case 'pt':
          return AppAssets.svgs.brazil;
        case 'en':
          return AppAssets.svgs.unitedStates;
        case 'es':
          return AppAssets.svgs.spain;
        default:
          return AppAssets.svgs.unitedStates;
      }
    },
    autoDispose: true,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        LocalizatiionSession().switchLocale();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            currentLanguageSVG.watch(context),
            width: 30,
            height: 30,
          ),
          const Icon(Icons.keyboard_arrow_down_rounded),
        ],
      ),
    );
  }
}
