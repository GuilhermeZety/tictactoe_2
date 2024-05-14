import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/app/core/common/services/connection/connection_checker_connection_service_impl.dart';
import 'package:tictactoe/app/core/common/services/connection/connection_service.dart';
import 'package:tictactoe/app/core/common/services/deep_links/deep_links_service.dart';
import 'package:tictactoe/app/modules/auth/auth_module.dart';
import 'package:tictactoe/app/modules/not_connection/presentation/pages/not_connection_page.dart';
import 'package:tictactoe/app/modules/not_found/presentation/pages/not_found_page.dart';
import 'package:tictactoe/app/modules/splash/presentation/pages/splash_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<ConnectionService>(() => ConnectionCheckerPlusServiceImpl());
    i.addSingleton<DeepLinksService>(() => DeepLinksService());
  }

  @override
  void routes(RouteManager r) {
    //MODULES
    r.module(
      '/auth/',
      module: AuthModule(),
      transition: TransitionType.fadeIn,
      duration: 500.ms,
    );
    //CHILDS
    r.child(
      '/',
      child: (args) => const SplashPage(),
      transition: TransitionType.fadeIn,
      duration: 500.ms,
    );
    r.child(
      '/not_connection/',
      child: (args) => const NotConnectionPage(),
      transition: TransitionType.fadeIn,
      duration: 800.ms,
    );
    r.wildcard(
      child: (args) => const NotFoundPage(),
      transition: TransitionType.fadeIn,
      duration: 800.ms,
    );
  }
}
