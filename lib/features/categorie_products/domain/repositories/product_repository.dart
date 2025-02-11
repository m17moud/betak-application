import 'package:betak/features/categorie_products/data/models/products_model.dart';
import 'package:betak/features/categorie_products/domain/entities/product_entity.dart';


import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductsModel>>> getProducts(  String pkey,String depID);

}
