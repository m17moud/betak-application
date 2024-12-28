import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../core/constants/constants.dart';
import '../models/customer_login_response_model.dart';

abstract class CustomerLoginLocalDataSource {
  Future<void> storeCustomerData(CustomerLoginResponseModel customerInfo);
  Future<CustomerLoginResponseModel> getCustomerData();
  Future<void> logout();
}

class CustomerLoginLocalDataSourceImpl extends CustomerLoginLocalDataSource {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  Future<void> storeCustomerData(
      CustomerLoginResponseModel customerInfo) async {
    String customerInfoJson = jsonEncode(customerInfo.toJson());

    await secureStorage.write(
        key: Constants.customerSecureStorage, value: customerInfoJson);
  }

  @override
  Future<CustomerLoginResponseModel> getCustomerData() async {
    String? customerInfoJson =
        await secureStorage.read(key: Constants.customerSecureStorage);

    if (customerInfoJson == null) {
      throw Exception("No authentication data found");
    }

    Map<String, dynamic> customerInfoMap = jsonDecode(customerInfoJson);
    return CustomerLoginResponseModel.fromJson(customerInfoMap);
  }

  @override
  Future<void> logout() async {
    await secureStorage.delete(key: Constants.customerSecureStorage);
  }
}
