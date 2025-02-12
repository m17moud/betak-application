import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

abstract class AddProductRepository {
  Future<Either<Failure, void>> addProduct(addProductEntity);
}
