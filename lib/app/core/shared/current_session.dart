import 'package:encrypt_shared_preferences/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tictactoe/app/core/common/constants/app_theme.dart';
import 'package:tictactoe/app/core/common/services/dotenv/env.dart';
import 'package:tictactoe/app/core/shared/location_session.dart';

class CurrentSession {
  late EncryptedSharedPreferences prefs;

  late Supabase supabase;

  SupabaseClient get client => supabase.client;
  GoTrueClient get auth => supabase.client.auth;
  User? get user => supabase.client.auth.currentUser;

  Future init() async {
    await Env.init();
    await EncryptedSharedPreferences.initialize(Env.sharedKey);
    prefs = EncryptedSharedPreferences.getInstance();
    LocalizatiionSession().init();
    AppTheme().init();
    //
    supabase = await Supabase.initialize(
      url: Env.get('SUPABASE_URL'),
      anonKey: Env.get('SUPABASE_ANON_KEY'),
    );
  }
}
