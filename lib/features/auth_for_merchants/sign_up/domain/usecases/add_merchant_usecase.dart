import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/merchant_signup_repository.dart';

class AddMerchantUsecase implements UseCase<void, FormData> {
  final MerchantSignupRepository merchantSignupRepository;

  AddMerchantUsecase({required this.merchantSignupRepository});
  @override
  Future<Either<Failure, void>> call(FormData formData) async {
    return await merchantSignupRepository.addMerchant(formData);
  }
}
