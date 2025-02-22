import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/add_product_repository.dart';

class AddProductUsecase implements UseCase<void, FormData> {
  final AddProductRepository addProductRepository;

  AddProductUsecase({required this.addProductRepository});
  @override
  Future<Either<Failure, void>> call(FormData formData) async {
    return await addProductRepository.addProduct(formData);
  }
}
