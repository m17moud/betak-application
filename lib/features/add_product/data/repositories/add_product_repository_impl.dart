import '../datasources/add_product_remote_datasource.dart';
import '../../domain/repositories/add_product_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/Network/network_info.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/errors/exceptions.dart';

class AddProductRepositoryImpl extends AddProductRepository {
  final NetworkInfo _networkInfo;
  final AddProductRemoteDatasource _addProductRemoteDatasource;

  AddProductRepositoryImpl({
    required AddProductRemoteDatasource addProductRemoteDatasource,
    required NetworkInfo networkInfo,
  })  : _networkInfo = networkInfo,
        _addProductRemoteDatasource = addProductRemoteDatasource;

  @override
  Future<Either<Failure, void>> addProduct(addProductEntity) async {
    if (await _networkInfo.isConnected) {
      try {
        await _addProductRemoteDatasource.addProduct(addProductEntity);
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
