import 'package:betak/features/auth_for_merchants/merhcant_check_session/data/models/merchant_payment_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/merchant_check_session_response_model.dart';

abstract class MerchantCheckSessionRepository {
  Future<Either<Failure, MerchantCheckSessionResponseModel>> merhcantCheckSession({
    required String pkey,
    required String tp,
    required String id,
    required String sessionId,
  });

  Future<Either<Failure, MerchantPaymentModel>> merchantPayment({
    required String pkey,
    required String tp,
    required String email,

  });

}
