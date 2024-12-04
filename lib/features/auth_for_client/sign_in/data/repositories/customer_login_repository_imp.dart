import 'package:betak/core/error/failures.dart';
import 'package:betak/core/errors/exceptions.dart';
import 'package:betak/core/network/network_info.dart';
import 'package:betak/features/auth_for_client/sign_in/data/models/customer_login_response_model.dart';
import 'package:dartz/dartz.dart';

import '../datasources/customer_login_local_data_source.dart';
import '../datasources/customer_login_remote_data_source.dart';


import '../../domain/repositories/customer_login_repository.dart';

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
      } on ServerException catch (e) {
        return Left(ServerFailure(e.toString()));

      } catch (e) {
        return Left(ServerFailure('Unexpected error: $e'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> userLogout() async {
    ;

    if (await _networkInfo.isConnected) {

      try {
        await _local.logout();
        return const Right(null);
      } catch (e) {
        return  Left(ServerFailure(e.toString()));
      }
    } else {

      return Left(NetworkFailure());
    }
  }


}
