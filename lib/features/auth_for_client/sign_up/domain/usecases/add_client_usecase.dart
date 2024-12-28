import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/client_signup_repository.dart';

class AddClientUsecase implements UseCase<void, FormData> {
  final ClientSignupRepository  clientSignupRepository;

  AddClientUsecase({required this.clientSignupRepository});
  @override
  Future<Either<Failure, void>> call(FormData formData) async {
    return await clientSignupRepository.addClint(formData);
  }
}
