
import 'package:dartz/dartz.dart';

abstract class IAuthFacade {
  Future<Either<Exception,Unit>> signInWithGoogle();
}
