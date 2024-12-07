import 'package:betak/core/api/dio_consumer.dart';
import 'package:betak/core/api/end_ponits.dart';
import 'package:dio/dio.dart';

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
