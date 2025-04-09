import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/verify_otp_repository.dart';

class VerifyOtpUsecase implements UseCase<void, FormData> {
  final VerifyOtpRepository verifyOtpRepository;

  VerifyOtpUsecase({required this.verifyOtpRepository});
  @override
  Future<Either<Failure, void>> call(FormData formData) async {
    return await verifyOtpRepository.verifyOTP(formData);
  }
}