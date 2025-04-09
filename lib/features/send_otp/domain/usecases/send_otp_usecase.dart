import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/send_otp_repository.dart';

class SendOtpUsecase implements UseCase<void, FormData> {
  final SendOtpRepository sendOtpRepository;

  SendOtpUsecase({required this.sendOtpRepository});
  @override
  Future<Either<Failure, void>> call(FormData formData) async {
    return await sendOtpRepository.sendOTP(formData);
  }
}