import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class VerifyOtpRepository {
  Future<Either<Failure, void>> verifyOTP(verifyOtpEntity);
}
