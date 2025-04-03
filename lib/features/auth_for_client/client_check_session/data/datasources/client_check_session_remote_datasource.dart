import 'package:betak/features/auth_for_client/client_check_session/data/models/client_payment_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';
import '../models/client_check_session_response_model.dart';

abstract class ClientCheckSessionRemoteDatasource {
  Future<ClientCheckSessionResponseModel> clientCheckSession(
      String pkey, String tp, String id, String sessionId);

  Future<ClientPaymentModel> clientPayment(
      String pkey, String tp, String email);
}

class ClientCheckSessionRemoteDatasourceImpl
    extends ClientCheckSessionRemoteDatasource {
  final DioConsumer dio;

  ClientCheckSessionRemoteDatasourceImpl({required this.dio});

  @override
  Future<ClientCheckSessionResponseModel> clientCheckSession(
      String pkey, String tp, String id, String sessionId) async {
    Map<String, dynamic> queryParameters = {
      "pkey": pkey,
      "tp": tp,
      "uid": id,
      "sessionid": sessionId,
    };

    var result = await dio.get(ApiConstants.checkSession,
        queryParameters: queryParameters);

    var checkSessionInfo = ClientCheckSessionResponseModel.fromJson(result);
    return checkSessionInfo;
  }

  @override
  Future<ClientPaymentModel> clientPayment(String pkey, String tp, String email)async{

    var formData = FormData.fromMap({
      ApiConstants.pKey: pkey,
      ApiConstants.tp: tp,
      'email': email,
    });
    var response = await dio.post(ApiConstants.payment, data: formData);
    var logResponse = ClientPaymentModel.fromJson(response);

    return logResponse;




  }

}
