import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/app/core/common/constants/app_routes.dart';
import 'package:tictactoe/app/core/common/services/connection/connection_service.dart';
import 'package:tictactoe/main.dart';

class SplashController {
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1));
    if (await Modular.get<ConnectionService>().isConnected) {
      if (session.user == null) {
        Modular.to.navigate(AppRoutes.auth);
        return;
      }
      Modular.to.navigate(AppRoutes.home);
    } else {
      Modular.to.navigate(AppRoutes.notConnection);
    }
  }
}
