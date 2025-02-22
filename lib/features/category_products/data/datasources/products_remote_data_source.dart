


import '../models/products_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductsModel>> getProducts(  String pkey,String depID);
}

class ProductsRemoteDataSourceImpl
    extends ProductsRemoteDataSource {
  final DioConsumer dio;

  ProductsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductsModel>> getProducts(  String pkey,String depID) async {
    var formData = FormData.fromMap({
      ApiConstants.pKey: pkey,
      'depr_id': depID});
    List<ProductsModel> products = [];
    var response = await dio.post(ApiConstants.selectProducts, data: formData);
    for (var productsJson in response) {
      products.add(ProductsModel.fromJson(productsJson));
    }

    return products;
  }

}
