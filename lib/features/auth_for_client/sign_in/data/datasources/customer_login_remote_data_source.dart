import 'package:betak/core/api/dio_consumer.dart';
import 'package:betak/core/api/end_ponits.dart';



import '../models/customer_login_response_model.dart';

abstract class CustomerLoginRemoteDataSource {
  Future<CustomerLoginResponseModel> login(String pkey,String loginemail, String loginpassword);

}
class CustomerLoginRemoteDataSourceImpl extends CustomerLoginRemoteDataSource {
  final DioConsumer dio;

  CustomerLoginRemoteDataSourceImpl({required this.dio});

  @override
  Future<CustomerLoginResponseModel> login(String pkey,String loginemail, String loginpassword) async {
    var response = await dio.post(
      ApiConstants.clientSignIn,
      data: {
        ApiConstants.pKey :pkey,
        'loginemail':loginemail ,
        'loginpassword': loginpassword,
      },
    );


      var logResponse = CustomerLoginResponseModel.fromJson(response[0]);

      return logResponse;

  }
}




