import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';

abstract class AddProductRemoteDatasource {
  Future<void> addProduct(FormData formData );
}

class AddProductRemoteDatasourceImpl extends AddProductRemoteDatasource {
  final DioConsumer dio;

  AddProductRemoteDatasourceImpl({required this.dio});

  @override
  Future<void> addProduct(FormData formData) async {

    await dio.post(ApiConstants.addProduct, data: formData);
  }
}
