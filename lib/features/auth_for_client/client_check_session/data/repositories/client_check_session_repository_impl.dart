import 'package:betak/core/error/failures.dart';
import 'package:betak/features/auth_for_client/client_check_session/data/models/client_check_session_response_model.dart';
import 'package:betak/features/auth_for_client/client_check_session/domain/repositories/client_check_session_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/Network/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../datasources/client_check_session_remote_datasource.dart';

class ClientCheckSessionRepositoryImpl extends ClientCheckSessionRepository {
  final ClientCheckSessionRemoteDatasource _remote;
  final NetworkInfo _networkInfo;

  ClientCheckSessionRepositoryImpl({
    required ClientCheckSessionRemoteDatasource remote,
    required NetworkInfo networkInfo,
  })  : _remote = remote,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, ClientCheckSessionResponseModel>> clientCheckSession(
      {required String pkey,
      required String tp,
      required String id,
      required String sessionId}) async {
    if (await _networkInfo.isConnected) {
      try {
        var checkSessionData =
            await _remote.clientCheckSession(pkey, tp, id, sessionId);

        return Right(checkSessionData);
      } on ServerException {
        return const Left(ServerFailure());
      } on ServerLoginAuthException {
        return const Left(LoginAuthFailure());
      } on UnAuthorizedException {
        return const Left(UnAuthorizedFailure());
      } on ConflictException {
        return const Left(ConflictFailure());
      } on GoneException {
        return const Left(GoneFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
