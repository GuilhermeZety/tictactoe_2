import 'package:dartz/dartz.dart';
import 'package:tictactoe/app/core/common/errors/failures.dart';
import 'package:tictactoe/app/core/common/features/usecases/usecase.dart';
import 'package:tictactoe/app/core/shared/features/auth/domain/repositories/auth_repository.dart';

class LoginAnonymous extends Usecase<bool, LoginAnonymousParams> {
  final AuthRepository repository;

  LoginAnonymous({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(
    LoginAnonymousParams params,
  ) async {
    return await repository.loginAnonymous(params.name);
  }
}

class LoginAnonymousParams {
  final String name;

  LoginAnonymousParams({
    required this.name,
  });
}
