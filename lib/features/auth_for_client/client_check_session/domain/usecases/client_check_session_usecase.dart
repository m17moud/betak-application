import 'package:betak/features/auth_for_client/client_check_session/data/models/client_check_session_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/client_check_session_repository.dart';

class ClientCheckSessionUsecase
    implements UseCase<void, CheckSessionParameters> {
  final ClientCheckSessionRepository repository;

  ClientCheckSessionUsecase(this.repository);

  @override
  Future<Either<Failure, ClientCheckSessionResponseModel>> call(params) async {
    return await repository.clientCheckSession(
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
