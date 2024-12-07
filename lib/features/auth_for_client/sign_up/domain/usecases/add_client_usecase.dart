import 'package:betak/core/error/failures.dart';
import 'package:betak/core/usecases/usecase.dart';
import 'package:betak/features/auth_for_client/sign_up/domain/repositories/client_signup_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AddClientUsecase implements UseCase<void, FormData> {
  final ClientSignupRepository  clientSignupRepository;

  AddClientUsecase({required this.clientSignupRepository});
  @override
  Future<Either<Failure, void>> call(FormData formData) async {
    return await clientSignupRepository.addClint(formData);
  }
}
