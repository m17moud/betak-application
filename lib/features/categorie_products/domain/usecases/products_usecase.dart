import 'package:betak/features/categorie_products/data/models/products_model.dart';
import 'package:betak/features/categorie_products/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class ProductsUsecase implements UseCase<List <ProductsModel>, Params> {
  final ProductsRepository repository;

  ProductsUsecase(this.repository);
  late Params params;
  @override
  Future<Either<Failure,List <ProductsModel> >> call(params) async {
    return await repository.getProducts(params.pkey,params.depID);
    
  }
}
class Params extends Equatable {
  final String pkey;
  final String depID;
  const Params({required this.pkey, required this.depID});
  @override
  List<Object?> get props => throw UnimplementedError();
}