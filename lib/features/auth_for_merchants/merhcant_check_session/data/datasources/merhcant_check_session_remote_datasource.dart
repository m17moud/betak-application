import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';
import '../models/merchant_check_session_response_model.dart';
import '../models/merchant_payment_model.dart';

abstract class MerchantCheckSessionRemoteDatasource {
  Future<MerchantCheckSessionResponseModel> merhcantCheckSession(
      String pkey, String tp, String id, String sessionId);
  Future<MerchantPaymentModel> merchantPayment(
      String pkey, String tp, String email);
}

class MerchantCheckSessionRemoteDatasourceImpl
    extends MerchantCheckSessionRemoteDatasource {
  final DioConsumer dio;

  MerchantCheckSessionRemoteDatasourceImpl({required this.dio});

  @override
  Future<MerchantCheckSessionResponseModel> merhcantCheckSession(
      String pkey, String tp, String id, String sessionId) async {
    Map<String, dynamic> queryParameters = {
      "pkey": pkey,
      "tp": tp,
      "uid": id,
      "sessionid": sessionId,
    };

    var result = await dio.get(ApiConstants.checkSession,
        queryParameters: queryParameters);

    var checkSessionInfo = MerchantCheckSessionResponseModel.fromJson(result);
    return checkSessionInfo;
  }

  @override
  Future<MerchantPaymentModel> merchantPayment(
      String pkey, String tp, String email) async {
    var formData = FormData.fromMap({
      ApiConstants.pKey: pkey,
      ApiConstants.tp: tp,
      'email': email,
    });
    var response = await dio.post(ApiConstants.payment, data: formData);

    var logResponse = MerchantPaymentModel.fromJson(response);

    return logResponse;
  }
}
