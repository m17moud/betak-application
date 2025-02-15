import 'package:dartz/dartz.dart';

import '../../../../core/Network/network_info.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/home_department_repository.dart';
import '../datasources/home_department_remote_data_source.dart';
import '../models/home_department_response_model.dart';

class HomeDepartmentRepositoryImpl extends HomeDepartmentRepository {
  final HomeDepartmentRemoteDataSource _remote;
  final NetworkInfo _networkInfo;

  HomeDepartmentRepositoryImpl({
    required HomeDepartmentRemoteDataSource remote,
    required NetworkInfo networkInfo,
  })  : _remote = remote,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, List<HomeDepartmentResponseModel>>> getDepartments({
    required String pkey,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        List<HomeDepartmentResponseModel> departmentData =
            await _remote.getDepartments(pkey);
        return Right(departmentData);
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
