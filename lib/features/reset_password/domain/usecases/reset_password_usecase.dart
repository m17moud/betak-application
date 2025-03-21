import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../repositories/reset_password_repository.dart';

class ResetPasswordUsecase implements UseCase<void, FormData> {
  final ResetPasswordRepository resetPasswordRepository;

  ResetPasswordUsecase({required this.resetPasswordRepository});
  @override
  Future<Either<Failure, void>> call(FormData formData) async {
    return await resetPasswordRepository.resetPassword(formData);
  }
}