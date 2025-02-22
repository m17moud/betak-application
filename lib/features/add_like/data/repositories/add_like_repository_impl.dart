import 'package:dartz/dartz.dart';

import '../../../../../core/Network/network_info.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../domain/repositories/add_like_repository.dart';
import '../datasources/add_like_remote_dataSource.dart';

class AddLikeRepositoryImpl extends AddLikeRepository {
  final NetworkInfo _networkInfo;
  final AddLikeRemoteDataSource _addLikeRemoteDatasource;

  AddLikeRepositoryImpl({
    required AddLikeRemoteDataSource addLikeRemoteDatasource,
    required NetworkInfo networkInfo,
  })  : _networkInfo = networkInfo,
        _addLikeRemoteDatasource = addLikeRemoteDatasource;

  @override
  Future<Either<Failure, void>> addLike(addLikeEntity) async {
    if (await _networkInfo.isConnected) {
      try {
        await _addLikeRemoteDatasource.addLike(addLikeEntity);
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

  @override
  Future<Either<Failure, List<dynamic>>> checkLike(
      addLikeEntity) async {
    if (await _networkInfo.isConnected) {
      try {
        var checkLikeResponse =
            await _addLikeRemoteDatasource.checkLike(addLikeEntity);
           
        return Right(checkLikeResponse);
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
