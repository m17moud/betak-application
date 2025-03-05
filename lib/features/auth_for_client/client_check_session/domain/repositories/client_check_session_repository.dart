import '../../data/models/client_check_session_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

abstract class ClientCheckSessionRepository {
  Future<Either<Failure, ClientCheckSessionResponseModel>> clientCheckSession({
    required String pkey,
    required String tp,
    required String id,
    required String sessionId,
  });
}
