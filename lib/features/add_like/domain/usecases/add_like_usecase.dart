import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/add_like_repository.dart';

class AddLikeUsecase implements UseCase<void, FormData> {
  final AddLikeRepository addLikeRepository;

  AddLikeUsecase({required this.addLikeRepository});
  @override
  Future<Either<Failure, void>> call(FormData formData) async {
    return await addLikeRepository.addLike(formData);
  }

  Future<Either<Failure, List<dynamic>>> callCheckLike(
      FormData formData) async {
    return await addLikeRepository.checkLike(formData);
  }
}
