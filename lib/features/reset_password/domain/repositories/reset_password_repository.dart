import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class ResetPasswordRepository {
  Future<Either<Failure, void>> resetPassword(resetPasswordEntity);
}
