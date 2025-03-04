import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/customer_login_repository.dart';


class CustomerLogoutUseCase implements UseCase<void, Parameters> {
  final CustomerLoginRepository repository;

  CustomerLogoutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.customerLogout(pkey: params.pkey,id: params.id,tp: params.tp);
  }
}
class Parameters extends Equatable {
  final String pkey;
  final String tp;
  final String id;
  const Parameters({required this.pkey,required this.tp, required this.id});
  @override
  List<Object?> get props => throw UnimplementedError();
}
