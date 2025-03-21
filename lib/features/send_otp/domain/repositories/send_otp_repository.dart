import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SendOtpRepository {
  Future<Either<Failure, void>> sendOTP(sendOtpEntity);

}