import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';

abstract class MerchantSignupRemoteDatasource {
  Future<void> merchantSignup(FormData formData);
}

class MerchantSignupRemoteDatasourceImpl
    extends MerchantSignupRemoteDatasource {
  final DioConsumer dio;

  MerchantSignupRemoteDatasourceImpl({required this.dio});

  @override
  Future<void> merchantSignup(FormData formData) async {
    await dio.post(ApiConstants.merchantSignUp, data: formData);
  }
}
