import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';
import '../models/merchant_login_response_model.dart';

abstract class MerchantLoginRemoteDataSource {
  Future<MerchantLoginResponseModel> login(String pkey,String loginemail, String loginpassword);
  Future<void> logout(String pkey,String tp, String id);

}
class MerchantLoginRemoteDataSourceImpl extends MerchantLoginRemoteDataSource {
  final DioConsumer dio;

  MerchantLoginRemoteDataSourceImpl({required this.dio});

  @override
  Future<MerchantLoginResponseModel> login(String pkey,String loginemail, String loginpassword) async {
    var formData = FormData.fromMap({
      ApiConstants.pKey :pkey,
      'loginemail':loginemail ,
      'loginpassword': loginpassword,
    });



    var response = await dio.post(
      ApiConstants.merchantSignIn,
      data: formData
    );

      var logResponse = MerchantLoginResponseModel.fromJson(response[0]);


      return logResponse;

  }


  @override
  Future<void> logout(String pkey,String tp, String id) async {
    var formData = FormData.fromMap({
      ApiConstants.pKey :pkey,
      ApiConstants.id:id ,
      ApiConstants.tp: tp,

    });

 await dio.post(
        ApiConstants.logout,
        data: formData,


    );


  }
}




