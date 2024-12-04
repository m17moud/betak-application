import 'package:betak/core/error/failures.dart';
import 'package:betak/core/usecases/usecase.dart';
import 'package:betak/features/auth_for_client/sign_in/domain/repositories/customer_login_repository.dart';
import 'package:dartz/dartz.dart';


class CustomerLogoutUseCase implements UseCase<void, NoParams> {
  final CustomerLoginRepository repository;

  CustomerLogoutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.customerLogout();
  }
}

