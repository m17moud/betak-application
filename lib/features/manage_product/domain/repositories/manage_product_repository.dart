import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

abstract class ManageProductRepository {
  Future<Either<Failure, void>> updateProduct(updateProductEntity);
  Future<Either<Failure, void>> deleteProduct(deleteProductEntity);

}
