import 'package:dartz/dartz.dart';

import '../../../../../core/Network/network_info.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../domain/repositories/verify_otp_repository.dart';
import '../datasources/verify_otp_remote_datasource.dart';

class VerifyOtpRepositoryImpl extends VerifyOtpRepository {
  final NetworkInfo _networkInfo;
  final VerifyOtpRemoteDatasource _verifyOtpRemoteDatasource;

  VerifyOtpRepositoryImpl({
    required VerifyOtpRemoteDatasource verifyOtpRemoteDatasource,
    required NetworkInfo networkInfo,
  })  : _networkInfo = networkInfo,
        _verifyOtpRemoteDatasource = verifyOtpRemoteDatasource;

  @override
  Future<Either<Failure, void>> verifyOTP(verifyOtpEntity) async {
    if (await _networkInfo.isConnected) {
      try {
        await _verifyOtpRemoteDatasource.verifyOtp(verifyOtpEntity);
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
