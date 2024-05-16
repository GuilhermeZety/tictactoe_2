import 'package:dartz/dartz.dart';
import 'package:tictactoe/app/core/common/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> loginWithGoogle();
  Future<Either<Failure, bool>> loginWithDiscord();
  Future<Either<Failure, bool>> loginWithGithub();
  Future<Either<Failure, bool>> loginAnonymous(String name);
}
