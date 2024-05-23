import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/app/core/common/constants/app_routes.dart';
import 'package:tictactoe/app/core/common/extensions/locale_extension.dart';
import 'package:tictactoe/app/ui/components/button.dart';
import 'package:tictactoe/app/ui/components/image_cached.dart';
import 'package:tictactoe/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageCached(
              url: session.user?.userMetadata?['picture'] as String? ?? '',
              radius: 1000,
              width: 100,
            ),
            const Gap(20),
            Text((session.user!.userMetadata!['name'] as String).t),
            const Gap(20),
            Button(
              onPressed: () async {
                session.auth.signOut();
                Modular.to.pushNamedAndRemoveUntil(AppRoutes.splash, (route) => false);
              },
              child: const Text('Loggout'),
            ),
          ],
        ),
      ),
    );
  }
}
