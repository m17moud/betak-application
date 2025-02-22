import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable(createToJson: false)
class ProductsModel {
  ProductsModel({
    required this.id,
    required this.pname,
    required this.pdescribtion,
    required this.pPrice,
    required this.departmentid,
    required this.sellerid,
    required this.images,
    required this.seller,
    required this.shops,
    required this.likes,
  });

  final String? id;
  final String? pname;
  final String? pdescribtion;

  @JsonKey(name: 'p_price')
  final double? pPrice;
  final int? departmentid;
  final String? sellerid;
  final List<String>? images;
  final Seller? seller;
  final List<dynamic>? shops;
  final int? likes;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);

}

@JsonSerializable(createToJson: false)
class Seller {
  Seller({
    required this.sname,
    required this.semail,
    required this.saddress,
    required this.smobile,
    required this.facebookUrl,
  });

  final String? sname;
  final String? semail;
  final String? saddress;
  final String? smobile;

  @JsonKey(name: 'facebook_url')
  final String? facebookUrl;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);

}
