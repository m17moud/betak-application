import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';

abstract class ManageProductRemoteDatasource {
  Future<void> updateProduct(FormData formData );
  Future<void> deleteProduct(FormData formData );

}

class ManageProductRemoteDatasourceImpl extends ManageProductRemoteDatasource {
  final DioConsumer dio;

  ManageProductRemoteDatasourceImpl({required this.dio});

  @override
  Future<void> updateProduct(FormData formData) async {

    await dio.post(ApiConstants.updateProducts, data: formData);
  }
  @override
  Future<void> deleteProduct(FormData formData) async {

    await dio.post(ApiConstants.deleteProducts, data: formData);
  }
}
