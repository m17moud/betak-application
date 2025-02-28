
import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';
import '../models/home_department_response_model.dart';

abstract class HomeDepartmentRemoteDataSource {
  Future<List<HomeDepartmentResponseModel>> getDepartments(String pkey);
}

class HomeDepartmentRemoteDataSourceImpl
    extends HomeDepartmentRemoteDataSource {
  final DioConsumer dio;

  HomeDepartmentRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<HomeDepartmentResponseModel>> getDepartments(String pkey) async {
    var formData = FormData.fromMap({
      ApiConstants.pKey: pkey,
    });

    var response = await dio.post(ApiConstants.home, data: formData);

    List<HomeDepartmentResponseModel> departments = [];

    for (var departmentJson in response) {
      departments.add(HomeDepartmentResponseModel.fromJson(departmentJson));
    }

    return departments;
  }
}
