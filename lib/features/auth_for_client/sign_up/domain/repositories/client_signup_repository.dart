import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

abstract class ClientSignupRepository {
  Future<Either<Failure, void>> addClint(clientSignupEntity);
}
