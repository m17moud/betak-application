


import 'package:dio/dio.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_ponits.dart';
import '../models/products_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductsModel>> getProducts(  String pkey,String depID,String idType);
}

class ProductsRemoteDataSourceImpl
    extends ProductsRemoteDataSource {
  final DioConsumer dio;

  ProductsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductsModel>> getProducts(  String pkey,String depID,String idType) async {
    var formData = FormData.fromMap({
      ApiConstants.pKey: pkey,
      idType: depID});
    List<ProductsModel> products = [];
    var response = await dio.post(ApiConstants.selectProducts, data: formData);
    for (var productsJson in response) {
      products.add(ProductsModel.fromJson(productsJson));
    }

    return products;
  }

}
