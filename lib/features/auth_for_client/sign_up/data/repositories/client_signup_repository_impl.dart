import 'package:betak/core/Network/network_info.dart';
import 'package:betak/core/error/failures.dart';
import 'package:betak/core/errors/exceptions.dart';
import 'package:betak/features/auth_for_client/sign_up/data/datasources/client_signup_remote_datasource.dart';
import 'package:betak/features/auth_for_client/sign_up/domain/repositories/client_signup_repository.dart';
import 'package:dartz/dartz.dart';

class ClientSignupRepositoryImpl extends ClientSignupRepository {
  final NetworkInfo _networkInfo;
  final ClientSignupRemoteDatasource _clientSignupRemoteDatasource;

  ClientSignupRepositoryImpl({
    required ClientSignupRemoteDatasource clientSignupRemoteDatasource,
    required NetworkInfo networkInfo,
  })  : _networkInfo = networkInfo,
        _clientSignupRemoteDatasource = clientSignupRemoteDatasource;

  @override
  Future<Either<Failure, void>> addClint(formData) async {
    try {
      if (await _networkInfo.isConnected) {
        await _clientSignupRemoteDatasource.clientSignup(formData);

        return const Right(null);
      } else {
        return const Left(NetworkFailure());
      }
    } on ServerException {
      return const Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
