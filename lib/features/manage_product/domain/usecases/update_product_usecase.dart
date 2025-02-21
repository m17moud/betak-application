import '../repositories/manage_product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';

class UpdateProductUsecase implements UseCase<void, FormData> {
  final ManageProductRepository manageProductRepository;

  UpdateProductUsecase({required this.manageProductRepository});
  @override
  Future<Either<Failure, void>> call(FormData formData) async {
    return await manageProductRepository.updateProduct(formData);
  }
}
