import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:tictactoe/app/core/common/services/connection/connection_service.dart';

class ConnectionCheckerPlusServiceImpl extends ConnectionService {
  @override
  Future<bool> get isConnected async {
    try {
      return await InternetConnection().hasInternetAccess;
    } catch (e) {
      return false;
    }
  }
}
