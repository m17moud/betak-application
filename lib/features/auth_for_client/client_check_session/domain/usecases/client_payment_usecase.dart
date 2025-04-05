import '../../data/models/client_payment_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/client_check_session_repository.dart';

class ClientPaymentUsecase
    implements UseCase<void, ClientPaymentParameters> {
  final ClientCheckSessionRepository repository;

  ClientPaymentUsecase(this.repository);

  @override
  Future<Either<Failure, ClientPaymentModel>> call(params) async {
    return await repository.clientPayment(
        pkey: params.pkey,
        email: params.email,
        tp: params.tp);
  }
}

class ClientPaymentParameters extends Equatable {
  final String pkey;
  final String tp;
  final String email;

  const ClientPaymentParameters(
      {required this.pkey,
        required this.tp,
        required this.email,
        });
  @override
  List<Object?> get props => throw UnimplementedError();
}
