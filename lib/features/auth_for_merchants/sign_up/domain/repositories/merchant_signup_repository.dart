import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

abstract class MerchantSignupRepository {
  Future<Either<Failure, void>> addMerchant(merchantSignupEntity);
}
