import '../models/merchant_payment_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/Network/network_info.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../domain/repositories/merchant_check_session_repository.dart';
import '../datasources/merhcant_check_session_remote_datasource.dart';
import '../models/merchant_check_session_response_model.dart';

class MerchantCheckSessionRepositoryImpl
    extends MerchantCheckSessionRepository {
  final MerchantCheckSessionRemoteDatasource _remote;
  final NetworkInfo _networkInfo;

  MerchantCheckSessionRepositoryImpl({
    required MerchantCheckSessionRemoteDatasource remote,
    required NetworkInfo networkInfo,
  })  : _remote = remote,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, MerchantCheckSessionResponseModel>>
      merhcantCheckSession(
          {required String pkey,
          required String tp,
          required String id,
          required String sessionId}) async {
    if (await _networkInfo.isConnected) {
      try {
        var checkSessionData =
            await _remote.merhcantCheckSession(pkey, tp, id, sessionId);

        return Right(checkSessionData);
      } on ServerException {
        return const Left(ServerFailure());
      } on ServerLoginAuthException {
        return const Left(LoginAuthFailure());
      } on UnAuthorizedException {
        return const Left(UnAuthorizedFailure());
      } on SessionExpiredException {
        return const Left(SessionExpiredFailure());
      }on PaymentRequiredException {
        return const Left(PaymentRequiredFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, MerchantPaymentModel>> merchantPayment(
      {required String pkey,
        required String tp,
        required String email}) async {
    if (await _networkInfo.isConnected) {
      try {
        var paymentURL =
        await _remote.merchantPayment(pkey, tp, email );

        return Right(paymentURL);
      } on ServerException {
        return const Left(ServerFailure());
      } on ServerLoginAuthException {
        return const Left(LoginAuthFailure());
      } on UnAuthorizedException {
        return const Left(UnAuthorizedFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
