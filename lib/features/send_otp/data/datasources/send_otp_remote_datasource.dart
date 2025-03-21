import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';

abstract class SendOtpRemoteDatasource {
  Future<void> sendOtp(FormData formData );

}

class SendOtpRemoteDatasourceImpl extends SendOtpRemoteDatasource {
  final DioConsumer dio;

  SendOtpRemoteDatasourceImpl({required this.dio});

  @override
  Future<void> sendOtp(FormData formData) async {

    await dio.post(ApiConstants.sendOTP, data: formData);
  }

}
