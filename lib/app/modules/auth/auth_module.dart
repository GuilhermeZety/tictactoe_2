import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/app/core/shared/features/auth/auth_logic.dart';
import 'package:tictactoe/app/modules/auth/presentation/pages/auth_page.dart';
import 'package:tictactoe/app/modules/auth/presentation/pages/guest_access_page.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    AuthLogic.binds(i);
  }

  @override
  void routes(RouteManager r) {
    // CHILDS
    r.child(
      '/',
      child: (args) => const AuthPage(),
      transition: TransitionType.fadeIn,
      duration: 500.ms,
    );
    r.child(
      '/guest/',
      child: (args) => const GuestAccessPage(),
      transition: TransitionType.rightToLeft,
      duration: 500.ms,
    );
  }
}
