import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tictactoe/app/core/common/services/dotenv/env.dart';
import 'package:tictactoe/app/core/shared/features/auth/data/datasources/supabase/auth_datasource.dart';
import 'package:tictactoe/main.dart';

class SupabaseAuthDatasourceImpl implements AuthDatasource {
  @override
  Future<bool> loginWithGoogle() async {
    // Configuração da google para login
    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: Env.get('GOOGLE_WEB_CLIENT_ID'),
      clientId: Env.get('GOOGLE_CLIENT_ID'),
    );

    // Trigger para deslogar o usuário para não logar com o ultimo email selecionado
    await googleSignIn.signOut();
    // Trigger logar de fato
    final googleUser = await googleSignIn.signIn();

    /// Caso de cancelamento retorna [false] como retorno
    if (googleUser == null) {
      return false;
    }

    final auth = await googleUser.authentication;

    if (auth.accessToken == null) {
      throw 'No Access Token found.';
    }
    if (auth.idToken == null) {
      throw 'No ID Token found.';
    }

    await session.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: auth.idToken!,
      accessToken: auth.accessToken!,
    );

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
    var response = await session.auth.signInAnonymously(
      data: {
        'name': name != '' ? name : '[anonymous]',
        'picture': 'https://gvnetwokeiwfqqtkvsae.supabase.co/storage/v1/object/public/images/guest_user.png',
      },
    );
    log(response.toString());
    return true;
  }
}
