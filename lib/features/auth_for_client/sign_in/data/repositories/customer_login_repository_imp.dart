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
  // ignore: non_constant_identifier_names
  Future<Either<Failure, CustomerLoginResponseModel>> CustomerLogin({
    required String pkey,
    required String loginemail,
    required String loginpassword,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        var customerData = await _remote.login(pkey, loginemail, loginpassword);
        await _local.storeCustomerData(customerData);

        return Right(customerData);
      } on ServerException {
        return const Left(ServerFailure());
      } on ServerLoginAuthException {
        return const Left(LoginAuthFailure());
      } on UnAuthorizedException {
        return const Left(UnAuthorizedFailure());
      } on GoneException {
        return const Left(GoneFailure());
      } on PaymentRequiredException {
        return const Left(PaymentRequiredFailure());
      } on PaymentAfterSignUpRequiredException {
        return const Left(PaymentAfterSignUpRequiredFailure());
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
  Future<Either<Failure, void>> customerLogout({
    required String pkey,
    required String tp,
    required String id,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        await _remote.logout(pkey, tp, id);

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
