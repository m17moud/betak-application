import 'package:betak/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class VerifyOtpRepository {
  Future<Either<Failure, void>> verifyOTP(verifyOtpEntity);
}
