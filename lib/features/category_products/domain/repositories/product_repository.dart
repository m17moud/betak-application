import '../../data/models/products_model.dart';


import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductsModel>>> getProducts(  String pkey,String depID,String idType);

}
