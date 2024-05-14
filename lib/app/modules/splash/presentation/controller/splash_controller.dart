import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/app/core/common/constants/app_routes.dart';
import 'package:tictactoe/app/core/common/services/connection/connection_service.dart';

class SplashController {
  Future<void> init() async {
    //TODO: REMOVE
    await Future.delayed(const Duration(seconds: 3));
    if (await Modular.get<ConnectionService>().isConnected) {
      Modular.to.navigate(AppRoutes.auth);
    } else {
      Modular.to.navigate(AppRoutes.notConnection);
    }
  }
}
