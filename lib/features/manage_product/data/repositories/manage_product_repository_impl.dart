import 'package:betak/features/manage_product/domain/repositories/manage_product_repository.dart';

import '../datasources/manage_product_remote_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/Network/network_info.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/errors/exceptions.dart';

class ManageProductRepositoryImpl extends ManageProductRepository {
  final NetworkInfo _networkInfo;
  final ManageProductRemoteDatasource _manageProductRemoteDatasource;

  ManageProductRepositoryImpl({
    required ManageProductRemoteDatasource manageProductRemoteDatasource,
    required NetworkInfo networkInfo,
  })  : _networkInfo = networkInfo,
        _manageProductRemoteDatasource = manageProductRemoteDatasource;

  @override
  Future<Either<Failure, void>> updateProduct(updateProductEntity) async {
    if (await _networkInfo.isConnected) {
      try {
        await _manageProductRemoteDatasource.updateProduct(updateProductEntity);
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

  Future<Either<Failure, void>> deleteProduct(deleteProductEntity) async {
    if (await _networkInfo.isConnected) {
      try {
        await _manageProductRemoteDatasource.deleteProduct(deleteProductEntity);
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
