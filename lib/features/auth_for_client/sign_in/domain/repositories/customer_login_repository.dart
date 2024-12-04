import 'package:betak/core/error/failures.dart';
import 'package:betak/features/auth_for_client/sign_in/data/models/customer_login_response_model.dart';


import 'package:dartz/dartz.dart';

abstract class CustomerLoginRepository {
  Future<Either<Failure, CustomerLoginResponseModel>> CustomerLogin({
    required String pkey,
    required String loginemail,
    required String loginpassword,
  });

  Future<Either<Failure, void>> customerLogout();




}
