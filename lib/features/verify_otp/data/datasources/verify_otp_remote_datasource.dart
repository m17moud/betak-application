import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';

abstract class VerifyOtpRemoteDatasource {
  Future<void> verifyOtp(FormData formData );

}

class VerifyOtpRemoteDatasourceImpl extends VerifyOtpRemoteDatasource {
  final DioConsumer dio;

  VerifyOtpRemoteDatasourceImpl({required this.dio});

  @override
  Future<void> verifyOtp(FormData formData) async {

    await dio.post(ApiConstants.verifyOTP, data: formData);
  }

}
