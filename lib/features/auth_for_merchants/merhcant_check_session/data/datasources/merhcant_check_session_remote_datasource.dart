import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';
import '../models/merchant_check_session_response_model.dart';

abstract class MerchantCheckSessionRemoteDatasource {
  Future<MerchantCheckSessionResponseModel> merhcantCheckSession(
      String pkey, String tp, String id, String sessionId);
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
}
