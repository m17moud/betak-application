import 'package:betak/core/error/failures.dart';
import 'package:betak/core/usecases/usecase.dart';
import 'package:betak/features/auth_for_client/sign_in/data/models/customer_login_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repositories/customer_login_repository.dart';

class CustomerLoginUsecase implements UseCase<CustomerLoginResponseModel, Params> {
  final CustomerLoginRepository repository;

  CustomerLoginUsecase(this.repository);
  late Params params;
  @override
  Future<Either<Failure, CustomerLoginResponseModel>> call(params) async {
    return await repository.CustomerLogin(
      pkey: params.pkey,
      loginemail: params.loginemail,
      loginpassword: params.loginpassword,
    );
  }
}

class Params extends Equatable {
  final String pkey;
  final String loginemail;
  final String loginpassword;
  const Params({required this.pkey,required this.loginemail, required this.loginpassword});
  @override
  List<Object?> get props => throw UnimplementedError();
}
