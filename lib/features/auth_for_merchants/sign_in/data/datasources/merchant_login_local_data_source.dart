import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../core/constants/constants.dart';
import '../models/merchant_login_response_model.dart';

abstract class MerchantLoginLocalDataSource {
  Future<void> storeMerchantData(MerchantLoginResponseModel merchantInfo);
  Future<MerchantLoginResponseModel> getMerchantData();
  Future<void> logout();
}

class MerchantLoginLocalDataSourceImpl extends MerchantLoginLocalDataSource {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  Future<void> storeMerchantData(
      MerchantLoginResponseModel merchantInfo) async {
    String merchantInfoJson = jsonEncode(merchantInfo.toJson());

    await secureStorage.write(
        key: Constants.merchantSecureStorage, value: merchantInfoJson);
  }

  @override
  Future<MerchantLoginResponseModel> getMerchantData() async {
    String? merchantInfoJson =
        await secureStorage.read(key: Constants.merchantSecureStorage);

    if (merchantInfoJson == null) {
      throw Exception("No authentication data found");
    }

    Map<String, dynamic> merchantInfoMap = jsonDecode(merchantInfoJson);
    return MerchantLoginResponseModel.fromJson(merchantInfoMap);
  }

  @override
  Future<void> logout() async {
    await secureStorage.delete(key: Constants.merchantSecureStorage);
  }
}
