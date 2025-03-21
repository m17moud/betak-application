import 'package:dartz/dartz.dart';

import '../../../../../core/Network/network_info.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../domain/repositories/reset_password_repository.dart';
import '../datasources/reset_password_remote_datasource.dart';

class ResetPasswordRepositoryImpl extends ResetPasswordRepository {
  final NetworkInfo _networkInfo;
  final ResetPasswordRemoteDatasource _resetPasswordRemoteDatasource;

  ResetPasswordRepositoryImpl({
    required ResetPasswordRemoteDatasource resetPasswordRemoteDatasource,
    required NetworkInfo networkInfo,
  })  : _networkInfo = networkInfo,
        _resetPasswordRemoteDatasource = resetPasswordRemoteDatasource;

  @override
  Future<Either<Failure, void>> resetPassword(resetPasswordEntity) async {
    if (await _networkInfo.isConnected) {
      try {
        await _resetPasswordRemoteDatasource.resetPassword(resetPasswordEntity);
        return const Right(null);
      } on ServerException {
        return const Left(ServerFailure());
      } on UnAuthorizedException {
        return const Left(UnAuthorizedFailure());
      } on ServerLoginAuthException {
        return const Left(LoginAuthFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
