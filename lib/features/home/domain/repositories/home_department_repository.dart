import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/home_department_response_model.dart';

abstract class HomeDepartmentRepository {
  Future<Either<Failure, List<HomeDepartmentResponseModel>>> getDepartments({
    required String pkey,
  });


}
