import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/app/core/shared/features/auth/data/datasources/supabase/supabase_auth_datasource_impl.dart';
import 'package:tictactoe/app/core/shared/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tictactoe/app/core/shared/features/auth/domain/repositories/auth_repository.dart';
import 'package:tictactoe/app/core/shared/features/auth/domain/usecases/login_anonymous.dart';
import 'package:tictactoe/app/core/shared/features/auth/domain/usecases/login_with_discord.dart';
import 'package:tictactoe/app/core/shared/features/auth/domain/usecases/login_with_github.dart';
import 'package:tictactoe/app/core/shared/features/auth/domain/usecases/login_with_google.dart';

class AuthLogic {
  static void binds(Injector i) {
    i.addLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        datasource: SupabaseAuthDatasourceImpl(),
      ),
    );
    i.addLazySingleton<LoginWithGoogle>(
      () => LoginWithGoogle(
        repository: Modular.get(),
      ),
    );
    i.addLazySingleton<LoginWithDiscord>(
      () => LoginWithDiscord(
        repository: Modular.get(),
      ),
    );
    i.addLazySingleton<LoginWithGithub>(
      () => LoginWithGithub(
        repository: Modular.get(),
      ),
    );
    i.addLazySingleton<LoginAnonymous>(
      () => LoginAnonymous(
        repository: Modular.get(),
      ),
    );
  }
}
