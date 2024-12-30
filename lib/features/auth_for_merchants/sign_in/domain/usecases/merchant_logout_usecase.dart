import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/merchant_login_repository.dart';


class MerchantLogoutUseCase implements UseCase<void, NoParams> {
  final MerchantLoginRepository repository;

  MerchantLogoutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.MerchantLogout();
  }
}

