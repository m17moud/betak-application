// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';

import '../../../../../core/Network/network_info.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../domain/repositories/merchant_login_repository.dart';
import '../datasources/merchant_login_local_data_source.dart';
import '../datasources/merchant_login_remote_data_source.dart';
import '../models/merchant_login_response_model.dart';

class MerchantLoginRepositoryImp extends MerchantLoginRepository {
  final MerchantLoginRemoteDataSource _remote;
  final MerchantLoginLocalDataSource _local;
  final NetworkInfo _networkInfo;

  MerchantLoginRepositoryImp({
    required MerchantLoginRemoteDataSource remote,
    required MerchantLoginLocalDataSource local,
    required NetworkInfo networkInfo,
  })  : _remote = remote,
        _local = local,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, MerchantLoginResponseModel>> MerchantLogin({
    required String pkey,
    required String loginemail,
    required String loginpassword,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        MerchantLoginResponseModel merchantData =
            await _remote.login(pkey, loginemail, loginpassword);
        await _local.storeMerchantData(merchantData);
        return Right(merchantData);
      } on ServerException {
        return const Left(ServerFailure());
      } on ServerLoginAuthException {
        return const Left(LoginAuthFailure());
      } on UnAuthorizedException {
        return const Left(UnAuthorizedFailure());
      } on ConflictException {
        return const Left(ConflictFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  Future<Either<Failure, void>> userLogout() async {
    if (await _networkInfo.isConnected) {
      try {
        await _local.logout();
        return const Right(null);
      } catch (e) {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> MerchantLogout() async {
    if (await _networkInfo.isConnected) {
      try {
        await _local.logout();
        return const Right(null);
      } catch (e) {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
