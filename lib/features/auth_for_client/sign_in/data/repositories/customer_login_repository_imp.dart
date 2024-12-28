import 'package:dartz/dartz.dart';

import '../../../../../core/Network/network_info.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../domain/repositories/customer_login_repository.dart';
import '../datasources/customer_login_local_data_source.dart';
import '../datasources/customer_login_remote_data_source.dart';
import '../models/customer_login_response_model.dart';

class CustomerLoginRepositoryImp extends CustomerLoginRepository {
  final CustomerLoginRemoteDataSource _remote;
  final CustomerLoginLocalDataSource _local;
  final NetworkInfo _networkInfo;

  CustomerLoginRepositoryImp({
    required CustomerLoginRemoteDataSource remote,
    required CustomerLoginLocalDataSource local,
    required NetworkInfo networkInfo,
  })  : _remote = remote,
        _local = local,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, CustomerLoginResponseModel>> CustomerLogin({
    required String pkey,
    required String loginemail,
    required String loginpassword,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        var customerData = await _remote.login(pkey,loginemail,loginpassword);
        await _local.storeCustomerData(customerData);
        return Right(customerData);
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

  Future<Either<Failure, void>> userLogout() async {


    if (await _networkInfo.isConnected) {

      try {
        await _local.logout();
        return const Right(null);
      } catch (e) {
        return  const Left(ServerFailure());
      }
    } else {

      return const Left(NetworkFailure());
    }
  }
  @override
  Future<Either<Failure, void>> customerLogout() async {


    if (await _networkInfo.isConnected) {

      try {
        await _local.logout();
        return const Right(null);
      } catch (e) {
        return  Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

}
