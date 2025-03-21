import '../datasources/send_otp_remote_datasource.dart';
import '../../domain/repositories/send_otp_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/Network/network_info.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/errors/exceptions.dart';


class SendOtpRepositoryImpl extends SendOtpRepository {
  final NetworkInfo _networkInfo;
  final SendOtpRemoteDatasource _sendOtpRemoteDatasource;

  SendOtpRepositoryImpl({
    required SendOtpRemoteDatasource  sendOtpRemoteDatasource,
    required NetworkInfo networkInfo,
  })  : _networkInfo = networkInfo,
        _sendOtpRemoteDatasource = sendOtpRemoteDatasource;

  @override
  Future<Either<Failure, void>> sendOTP(sendOtpEntity) async {
    if (await _networkInfo.isConnected) {
      try {
        await _sendOtpRemoteDatasource.sendOtp(sendOtpEntity);
        return const Right(null);
      } on ServerException {
        return const Left(ServerFailure());
      } on UnAuthorizedException {
        return const Left(UnAuthorizedFailure());
      }on ServerLoginAuthException {
        return const Left(LoginAuthFailure());

      }
    } else {
      return const Left(NetworkFailure());
    }
  }

}
