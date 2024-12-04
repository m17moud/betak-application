import 'package:betak/core/constants/constants.dart';
import 'package:betak/features/auth_for_client/sign_in/data/models/customer_login_response_model.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

abstract class CustomerLoginLocalDataSource {
  Future<void> storeCustomerData(CustomerLoginResponseModel customerInfo );
  Future<CustomerLoginResponseModel> getCustomerData();
  Future<void> logout();
}

class CustomerLoginLocalDataSourceImpl extends CustomerLoginLocalDataSource {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  Future<void> storeCustomerData(CustomerLoginResponseModel customerInfo) async {
    // Serialize the Auth object to JSON
    String customerInfoJson = jsonEncode(customerInfo.toJson());

    // Store the serialized Auth data in secure storage
    await secureStorage.write(
        key: Constants.customerSecureStorage, value: customerInfoJson);
  }

  @override
  Future<CustomerLoginResponseModel> getCustomerData() async {
    // Retrieve the serialized Auth data from secure storage
    String? customerInfoJson =
        await secureStorage.read(key: Constants.customerSecureStorage);

    // Handle case where no auth data is found
    if (customerInfoJson == null) {
      throw Exception("No authentication data found");
    }

    // Deserialize the JSON back into an Auth object
    Map<String, dynamic>customerInfoMap = jsonDecode(customerInfoJson);
    return CustomerLoginResponseModel.fromJson(customerInfoMap);
  }

  @override
  Future<void> logout() async {
    // Remove the auth data from secure storage
    await secureStorage.delete(key: Constants.customerSecureStorage);
  }
}
