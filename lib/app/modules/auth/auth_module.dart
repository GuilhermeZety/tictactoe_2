import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/app/modules/auth/presentation/pages/auth_page.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    // CHILDS
    r.child(
      '/',
      child: (args) => const AuthPage(),
      transition: TransitionType.fadeIn,
      duration: 500.ms,
    );
  }
}
