import '../../data/models/home_department_response_model.dart';
import '../repositories/home_department_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';

class HomeUsecase
    implements UseCase<List<HomeDepartmentResponseModel>, Params> {
  final HomeDepartmentRepository repository;

  HomeUsecase(this.repository);
  late Params params;
  @override
  Future<Either<Failure, List<HomeDepartmentResponseModel>>> call(
      params) async {
    return await repository.getDepartments(
      pkey: params.pkey,
    );
  }
}

class Params extends Equatable {
  final String pkey;

  const Params({
    required this.pkey,
  });
  @override
  List<Object?> get props => throw UnimplementedError();
}
