
import '../datasources/products_remote_data_source.dart';
import '../models/products_model.dart';
import '../../domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/Network/network_info.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/errors/exceptions.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsRemoteDataSource _remote;
  final NetworkInfo _networkInfo;

  ProductsRepositoryImpl({
    required ProductsRemoteDataSource remote,
    required NetworkInfo networkInfo,
  })  : _remote = remote,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, List<ProductsModel>>> getProducts(
     String pkey,
     String depID,String idType)
  async {
    if (await _networkInfo.isConnected) {
      try {
        List<ProductsModel> productsData =
        await _remote.getProducts(pkey,depID, idType);
        return Right(productsData);
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
