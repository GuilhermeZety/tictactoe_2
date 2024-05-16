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
  late String currentLanguageSVG;

  @override
  void initState() {
    update(LocalizatiionSession().locale.value.languageCode);
    effect(() {
      var value = LocalizatiionSession().locale.value.languageCode;
      if (value != currentLanguageSVG) {
        update(LocalizatiionSession().locale.value.languageCode);
      }
    });
    super.initState();
  }

  void update(String value) {
    currentLanguageSVG = switch (value) {
      'pt' => AppAssets.svgs.brazil,
      'en' => AppAssets.svgs.unitedStates,
      'es' => AppAssets.svgs.spain,
      _ => AppAssets.svgs.unitedStates,
    };
    if (mounted) setState(() {});
  }

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
            currentLanguageSVG,
            width: 30,
            height: 30,
          ),
          const Icon(Icons.keyboard_arrow_down_rounded),
        ],
      ),
    );
  }
}
