import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ResetPasswordRepository {
  Future<Either<Failure, void>> resetPassword(resetPasswordEntity);
}
