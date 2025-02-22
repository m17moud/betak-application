import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

abstract class AddLikeRepository {
  Future<Either<Failure, void>> addLike(addLikeEntity);
  Future<Either<Failure, List<dynamic>>> checkLike(addLikeEntity);
}
