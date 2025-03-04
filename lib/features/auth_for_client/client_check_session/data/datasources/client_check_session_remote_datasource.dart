import 'package:betak/features/auth_for_client/client_check_session/data/models/client_check_session_response_model.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';

abstract class ClientCheckSessionRemoteDatasource {
  Future<ClientCheckSessionResponseModel> clientCheckSession(
      String pkey, String tp, String id, String sessionId);
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
}
