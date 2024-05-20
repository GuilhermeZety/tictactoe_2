import 'dart:developer';

import 'package:tictactoe/app/core/shared/features/auth/data/datasources/supabase/auth_datasource.dart';
import 'package:tictactoe/main.dart';

class SupabaseAuthDatasourceImpl implements AuthDatasource {
  @override
  Future<bool> loginWithGoogle() async {
    return true;
  }

  @override
  Future<bool> loginWithDiscord() async {
    return true;
  }

  @override
  Future<bool> loginWithGithub() async {
    return true;
  }

  @override
  Future<bool> loginAnonymous(String name) async {
    var response = await session.supabase.client.auth.signInAnonymously(
      data: {
        'name': name != '' ? name : '[anonymous]',
        'photo': 'https://gvnetwokeiwfqqtkvsae.supabase.co/storage/v1/object/public/images/guest_user.png',
      },
    );
    log(response.toString());
    return true;
  }
}
