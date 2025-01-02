import 'package:dartz/dartz.dart';

import '../../../../../core/Network/network_info.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../domain/repositories/merchant_signup_repository.dart';
import '../datasources/merchant_signup_remote_datasource.dart';

class MerchantSignupRepositoryImpl extends MerchantSignupRepository {
  final NetworkInfo _networkInfo;
  final MerchantSignupRemoteDatasource _merchantSignupRemoteDatasource;

  MerchantSignupRepositoryImpl({
    required MerchantSignupRemoteDatasource merchantSignupRemoteDatasource,
    required NetworkInfo networkInfo,
  })  : _networkInfo = networkInfo,
        _merchantSignupRemoteDatasource = merchantSignupRemoteDatasource;

  @override
  Future<Either<Failure, void>> addMerchant(merchantSignupEntity) async {
    if (await _networkInfo.isConnected) {
      try {
        await _merchantSignupRemoteDatasource.merchantSignup(merchantSignupEntity);
        return const Right(null);
      } on ServerException {
        return const Left(ServerFailure());
      } on UnAuthorizedException {
        return const Left(UnAuthorizedFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
