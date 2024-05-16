import 'package:encrypt_shared_preferences/provider.dart';
import 'package:tictactoe/app/core/common/services/dotenv/env.dart';
import 'package:tictactoe/app/core/shared/location_session.dart';

class CurrentSession {
  late EncryptedSharedPreferences prefs;

  Future init() async {
    await Env.init();

    await EncryptedSharedPreferences.initialize(Env.sharedKey);
    prefs = EncryptedSharedPreferences.getInstance();
    LocalizatiionSession().init();
  }
}
