import 'package:encrypt_shared_preferences/provider.dart';
import 'package:tictactoe/app/core/common/services/dotenv/env.dart';

class CurrentSession {
  //SingleTon
  CurrentSession._();
  static final CurrentSession _instance = CurrentSession._();
  factory CurrentSession() => CurrentSession._instance;
  //

  late EncryptedSharedPreferences prefs;

  // UserEntity? user;
  String? fidelizerAccessToken;

  int? qtdActiveFidelities;

  Future init() async {
    await Env.init();

    await EncryptedSharedPreferences.initialize(Env.sharedKey);
    prefs = EncryptedSharedPreferences.getInstance();
  }

  // Future getSession() async {
  //   if (Env.isWhiteLabel) {
  //     await setAccessType(2);
  //   }
  //   if (await Modular.get<ConnectionService>().isConnected) {
  //     await Modular.get<UpdatePlans>()(NoParams());
  //   }
  //   if (accessToken() != null) {
  //     user = await Modular.get<GetUser>()(NoParams()).then((value) => value.getRight<UserEntity>());
  //     if (user?.fidelizer != null) {
  //       fidelizerAccessToken = await Modular.get<GetFidelizerToken>()(NoParams()).then((value) => value.getRight<String>());
  //     }
  //   }
  // }
}
