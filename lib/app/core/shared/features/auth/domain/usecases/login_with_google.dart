import 'package:dartz/dartz.dart';
import 'package:tictactoe/app/core/common/errors/failures.dart';
import 'package:tictactoe/app/core/common/features/usecases/usecase.dart';
import 'package:tictactoe/app/core/shared/features/auth/domain/repositories/auth_repository.dart';

class LoginWithGoogle extends Usecase<bool, NoParams> {
  final AuthRepository repository;

  LoginWithGoogle({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(
    NoParams params,
  ) async {
    return await repository.loginWithGoogle();
  }
}
