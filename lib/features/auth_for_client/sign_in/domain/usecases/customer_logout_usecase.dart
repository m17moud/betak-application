import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/customer_login_repository.dart';


class CustomerLogoutUseCase implements UseCase<void, NoParams> {
  final CustomerLoginRepository repository;

  CustomerLogoutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.customerLogout();
  }
}

