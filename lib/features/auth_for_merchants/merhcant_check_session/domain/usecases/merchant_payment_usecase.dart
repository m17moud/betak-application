import '../../data/models/merchant_payment_model.dart';
import '../repositories/merchant_check_session_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';


class MerchantPaymentUsecase
    implements UseCase<void, MerchantPaymentParameters> {
  final MerchantCheckSessionRepository repository;

  MerchantPaymentUsecase(this.repository);

  @override
  Future<Either<Failure, MerchantPaymentModel>> call(params) async {
    return await repository.merchantPayment(
        pkey: params.pkey,
        email: params.email,
        tp: params.tp);
  }
}

class MerchantPaymentParameters extends Equatable {
  final String pkey;
  final String tp;
  final String email;

  const MerchantPaymentParameters(
      {required this.pkey,
        required this.tp,
        required this.email,
      });
  @override
  List<Object?> get props => throw UnimplementedError();
}
