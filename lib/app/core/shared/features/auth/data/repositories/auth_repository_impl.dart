import 'package:dartz/dartz.dart';
import 'package:tictactoe/app/core/common/errors/failures.dart';
import 'package:tictactoe/app/core/common/services/treater/treater_service.dart';
import 'package:tictactoe/app/core/shared/features/auth/data/datasources/supabase/auth_datasource.dart';
import 'package:tictactoe/app/core/shared/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, bool>> loginWithGoogle() async {
    return TreaterService()<bool>(
      () async {
        return await datasource.loginWithGoogle();
      },
      errorIdentification: 'Erro ao efetuar o login com o google',
    );
  }

  @override
  Future<Either<Failure, bool>> loginWithDiscord() async {
    return TreaterService()<bool>(
      () async {
        return await datasource.loginWithDiscord();
      },
      errorIdentification: 'Erro ao efetuar o login com o discord',
    );
  }

  @override
  Future<Either<Failure, bool>> loginWithGithub() async {
    return TreaterService()<bool>(
      () async {
        return await datasource.loginWithGithub();
      },
      errorIdentification: 'Erro ao efetuar o login com o github',
    );
  }

  @override
  Future<Either<Failure, bool>> loginAnonymous(String name) async {
    return TreaterService()<bool>(
      () async {
        return await datasource.loginAnonymous(name);
      },
      errorIdentification: 'Erro ao efetuar o login como convidado',
    );
  }
}
