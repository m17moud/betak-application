import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';

abstract class ResetPasswordRemoteDatasource {
  Future<void> resetPassword(FormData formData);
}

class ResetPasswordRemoteDatasourceImpl extends ResetPasswordRemoteDatasource {
  final DioConsumer dio;

  ResetPasswordRemoteDatasourceImpl({required this.dio});

  @override
  Future<void> resetPassword(FormData formData) async {
    await dio.post(ApiConstants.resetPassword, data: formData);
  }
}
