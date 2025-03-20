import 'package:betak/core/error/failures.dart';
import 'package:betak/core/usecases/usecase.dart';
import 'package:betak/features/verify_otp/domain/repositories/verify_otp_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class VerifyOtpUsecase implements UseCase<void, FormData> {
  final VerifyOtpRepository verifyOtpRepository;

  VerifyOtpUsecase({required this.verifyOtpRepository});
  @override
  Future<Either<Failure, void>> call(FormData formData) async {
    return await verifyOtpRepository.verifyOTP(formData);
  }
}