import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/products_model.dart';
import '../repositories/product_repository.dart';

class ProductsUsecase implements UseCase<List <ProductsModel>, Params> {
  final ProductsRepository repository;

  ProductsUsecase(this.repository);
  late Params params;
  @override
  Future<Either<Failure,List <ProductsModel> >> call(params) async {
    return await repository.getProducts(params.pkey,params.depID,params.idType);
    
  }
}
class Params extends Equatable {
  final String pkey;
  final String depID;
  final String idType;
  const Params({required this.pkey, required this.depID,required this.idType});
  @override
  List<Object?> get props => throw UnimplementedError();
}