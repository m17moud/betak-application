import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/customer_login_response_model.dart';

abstract class CustomerLoginRepository {
  // ignore: non_constant_identifier_names
  Future<Either<Failure, CustomerLoginResponseModel>> CustomerLogin({
    required String pkey,
    required String loginemail,
    required String loginpassword,
  });

  Future<Either<Failure, void>> customerLogout({ required String pkey,
    required String tp,
    required String id,
  });




}
