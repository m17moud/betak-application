import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/products_model.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductsModel>>> getProducts(  String pkey,String depID,String idType);

}
