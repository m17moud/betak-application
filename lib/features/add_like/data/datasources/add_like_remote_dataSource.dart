// ignore_for_file: file_names

import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';

abstract class AddLikeRemoteDataSource {
  Future<void> addLike(FormData formData);
  Future<List<dynamic>> checkLike(FormData formData);
}

class AddLikeRemoteDataSourceImpl extends AddLikeRemoteDataSource {
  final DioConsumer dio;

  AddLikeRemoteDataSourceImpl({required this.dio});

  @override
  Future<void> addLike(FormData formData) async {
    await dio.post(ApiConstants.addLike, data: formData);
  }

  @override
  Future<List<dynamic>> checkLike(FormData formData) async {
    var response = await dio.post(ApiConstants.checkLike, data: formData);
    return response;
  }
}
