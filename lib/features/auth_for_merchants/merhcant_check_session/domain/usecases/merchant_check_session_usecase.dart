import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../data/models/merchant_check_session_response_model.dart';
import '../repositories/merchant_check_session_repository.dart';

class MerchantCheckSessionUsecase
    implements UseCase<void, CheckSessionParameters> {
  final MerchantCheckSessionRepository repository;

  MerchantCheckSessionUsecase(this.repository);

  @override
  Future<Either<Failure, MerchantCheckSessionResponseModel>> call(
      params) async {
    return await repository.merhcantCheckSession(
        pkey: params.pkey,
        id: params.id,
        tp: params.tp,
        sessionId: params.sessionId);
  }
}

class CheckSessionParameters extends Equatable {
  final String pkey;
  final String tp;
  final String id;
  final String sessionId;
  const CheckSessionParameters(
      {required this.pkey,
      required this.tp,
      required this.id,
      required this.sessionId});
  @override
  List<Object?> get props => throw UnimplementedError();
}
