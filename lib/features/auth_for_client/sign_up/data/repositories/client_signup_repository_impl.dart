import 'package:dartz/dartz.dart';

import '../../../../../core/Network/network_info.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../domain/repositories/client_signup_repository.dart';
import '../datasources/client_signup_remote_datasource.dart';

class ClientSignupRepositoryImpl extends ClientSignupRepository {
  final NetworkInfo _networkInfo;
  final ClientSignupRemoteDatasource _clientSignupRemoteDatasource;

  ClientSignupRepositoryImpl({
    required ClientSignupRemoteDatasource clientSignupRemoteDatasource,
    required NetworkInfo networkInfo,
  })  : _networkInfo = networkInfo,
        _clientSignupRemoteDatasource = clientSignupRemoteDatasource;

  @override
  Future<Either<Failure, void>> addClint(clientSignupEntity) async {
    if (await _networkInfo.isConnected) {
      try {
        await _clientSignupRemoteDatasource.clientSignup(clientSignupEntity);
        return const Right(null);
      } on ServerException {
        return const Left(ServerFailure());
      } on UnAuthorizedException {
        return const Left(UnAuthorizedFailure());
      } on ConflictException {
        return const Left(ConflictFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
