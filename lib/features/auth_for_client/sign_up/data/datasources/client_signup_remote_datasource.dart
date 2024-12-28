import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';

abstract class ClientSignupRemoteDatasource {
  Future<void> clientSignup(FormData formData );
}

class ClientSignupRemoteDatasourceImpl extends ClientSignupRemoteDatasource {
  final DioConsumer dio;

  ClientSignupRemoteDatasourceImpl({required this.dio});

  @override
  Future<void> clientSignup(FormData formData) async {

    await dio.post(ApiConstants.clientSignUp, data: formData);
  }
}
