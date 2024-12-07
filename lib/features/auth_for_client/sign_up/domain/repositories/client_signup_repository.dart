import 'package:betak/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ClientSignupRepository {
  Future<Either<Failure, void>> addClint(clientSignupEntity);
}
