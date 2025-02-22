// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/merchant_login_response_model.dart';

abstract class MerchantLoginRepository {
  Future<Either<Failure, MerchantLoginResponseModel>> MerchantLogin({
    required String pkey,
    required String loginemail,
    required String loginpassword,
  });

  Future<Either<Failure, void>> MerchantLogout();




}
